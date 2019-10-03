/*********************  P r o g r a m  -  M o d u l e ***********************/
/*!
 *        \file  men_z25_serial.c
 *
 *      \author  kp/ub/ts
 *
 *      \brief Register 16Z025/125 UARTs at serial8250 core driver
 *
 * Switches: CONFIG_MEN_Z025_UART_BASECLK - Set default base clock
 *                                          (default is 33333333 Hz).
 *
 *---------------------------------------------------------------------------
 * Copyright 2019, MEN Mikro Elektronik GmbH
 ****************************************************************************/
/*
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/ioport.h>
#include <linux/ide.h>
#include <linux/init.h>
#include <linux/serial.h>
#include <linux/version.h>
#include <linux/serial_core.h>
#include <linux/serial_8250.h>
#include <asm/io.h>
#include <asm/serial.h>
#include <MEN/men_chameleon.h>

/* activate this to get thorough debug outputs */
/* #define DBG */

#define Z25_MODE_SE		0x01	/* single ended (RS232) */
#define Z25_MODE_FDX		0x05	/* differential, full duplex */
#define Z25_MODE_HDXE		0x0d	/* differential, half duplex, with echo */
#define Z25_MODE_HDX		0x0f	/* differential, half duplex, echo suppressed */

#define MEN_Z25_MAX_SETUP 	64
#define Z25_DRV_NAM		"MEN 13Z025"
#define MODE_MAX_LEN		255 /* chars of mode */
#ifdef DBG
#define DBGOUT(x...) printk(x)
#else
#define DBGOUT(x...)
#endif /* DBG */

#ifndef CONFIG_MEN_Z025_UART_BASECLK
# define CONFIG_MEN_Z025_UART_BASECLK 33333333
#endif

#define MEN_Z25_READB( addr )         (ioMapped ?	inb((unsigned long)addr) : readb((void*)addr))
#define MEN_Z25_WRITEB( val, addr )   (ioMapped ? outb(val,(unsigned long)addr) : writeb(val,(void*)addr))


/*
 * UART port structs / registering functions depending on kernel Version
 */
#if LINUX_VERSION_CODE < KERNEL_VERSION(3,7,0)
# define UART_8250_PORT_STRUCT 		uart_port
# define UART_8250_REGISTER_FUNC	serial8250_register_port
# define UART_8250_UNREGISTER_FUNC	serial8250_unregister_port
# define UART_8250_IOMEMBASE  		men_uart_port.membase
#else
# define UART_8250_PORT_STRUCT 		uart_8250_port
# define UART_8250_REGISTER_FUNC	serial8250_register_8250_port
# define UART_8250_UNREGISTER_FUNC 	serial8250_unregister_port
# define UART_8250_IOMEMBASE  		men_uart_port.port.membase
#endif

static int G_menZ25Nr;			/**< current number of MEN_Z25 uarts found */
static int G_menZ25_mode[MEN_Z25_MAX_SETUP];

/*
 * Probe for all Frodo controllers. Each may have up to 4 UARTs
 */
static int uarts_probe( CHAMELEON_UNIT_T *chu );
static int uarts_remove( CHAMELEON_UNIT_T *chu );

static u16 G_modCodeArr[] = { 	CHAMELEON_16Z025_UART,  /* Standard Quad UART Z025 	*/
				CHAMELEON_16Z125_UART, 	/* ChamV2 Single UART 		*/
				CHAMELEON_16Z057_UART, 	/*  Z025 w/ special clk 	*/
				CHAMELEON_MODCODE_END };

static CHAMELEON_DRIVER_T G_driver = {
	.name		=	"men_z25-serial",
	.modCodeArr 	=	G_modCodeArr,
	.probe		=	uarts_probe,
	.remove		=	uarts_remove
};

/** this structure is stored as driver_data in chameleon_unit */
typedef struct {
	volatile unsigned char *uartBase[4];	/* mapped base addresses of UARTs 		*/
	volatile unsigned char* modeReg;        /* mapped base addresses of mode register 	*/
	int  line[4];				/* serial.c lines assigned (for unregister) 	*/
} MEN_Z25_DRVDATA_T;

/*******************************************************************/
/** module parameters
 */
static char *mode = "";

/*
 * In MEN FPGAs, the Base Clock for UART FPGA Units is the PCI Clock that
 * is fed into the FPGAs Carrier Board like the F206/F210.
 */
static ulong baud_base = (33333333/32); /* was magic 1041600 in prev. Revision */
static char *fixed_type = "0";

module_param( mode, charp, 0 );
module_param( baud_base, ulong, 0 );
module_param( fixed_type, charp, 0 );

MODULE_PARM_DESC( mode, "phys. mode for each port e.g.: mode=\"se df_fdx df_hdxe\"" );
MODULE_PARM_DESC( baud_base, "Base for baudrate generation" );
MODULE_PARM_DESC( fixed_type, "UART port fixed_type=0 (autoscan)/fixed_type=1 (PORT_16550A)" );

/*******************************************************************/
/** PNP function for 16Z025 Quad UART
 *
 * This gets called when the chameleon PNP subsystem starts and
 * is called for each Z25 unit. The Function searches in base+0x40 for
 * the 1-4 implemented UARTs
 *
 * \param chu	\IN 	z25 unit found
 * \return 		0 on success or negative linux error number
 */
static int z25_probe( CHAMELEON_UNIT_T *chu )
{
	unsigned char *uart_physbase;
	unsigned char *iomemP;
	struct UART_8250_PORT_STRUCT   men_uart_port;
	unsigned char exist_mask, b;
	int line, i, ioMapped;
	MEN_Z25_DRVDATA_T *drvData;

	uart_physbase = (unsigned char *)chu->phys;

	DBGOUT("z125_probe: physBase=%p irq=%d baud_base=%d\n",
		   uart_physbase, chu->irq, baud_base );

	/*--- get storage for intermediate data ---*/
	drvData = kmalloc( sizeof(MEN_Z25_DRVDATA_T), GFP_KERNEL );
	chu->driver_data = drvData;

	if( !drvData ) {
		printk( KERN_ERR "z25_probe: no mem!\n");
		return -ENOMEM;
	}

	/*--- are we io-mapped ? ---*/
	ioMapped = pci_resource_flags( chu->pdev, chu->bar ) & IORESOURCE_IO;
	DBGOUT( "bar=%d ioMapped=0x%x\n", chu->bar, ioMapped );

	if( ioMapped )
		drvData->modeReg = uart_physbase+0x40;
	else {
		iomemP = (unsigned char*)ioremap((unsigned long)uart_physbase+0x40, 1);
		drvData->modeReg = iomemP;
	}

	/*--- check existence of up to 4 UARTs inside 16Z025 ---*/
	exist_mask = MEN_Z25_READB(drvData->modeReg) & 0xf0;
	DBGOUT( "Z25 exist_mask=0x%x\n", exist_mask );

	for( i=0, b=0x10; i<4; ++i, b<<=1 ) {

		DBGOUT(KERN_INFO Z25_DRV_NAM ": z25_probe run %d:\n", i );
		drvData->line[i] = -1;	/* no serial dev number assigned */

		if( exist_mask & b ) {
			int modeval;
			memset( &men_uart_port, 0, sizeof(men_uart_port));
#if LINUX_VERSION_CODE < KERNEL_VERSION(3,7,0)
			men_uart_port.uartclk  			= baud_base * 16 ;
			men_uart_port.irq 	   		= chu->irq;
			men_uart_port.flags 	   		= UPF_SKIP_TEST|UPF_SHARE_IRQ|UPF_BOOT_AUTOCONF;
			men_uart_port.regshift 			= 0;

			if( ioMapped ) {
				men_uart_port.iotype		= UPIO_PORT;
				men_uart_port.iobase		= (volatile unsigned long)(uart_physbase+i*0x10);
				DBGOUT(KERN_INFO "men_uart_port.iobase=0x%08x\n", men_uart_port.iobase );
			} else {
				men_uart_port.iotype 		= UPIO_MEM;
				drvData->uartBase[i]    	= (volatile void*)ioremap_nocache((ulong)uart_physbase + i*0x10, 0x10 );
				men_uart_port.membase 		= (unsigned char*)drvData->uartBase[i];
				men_uart_port.mapbase 		= (volatile resource_size_t)(volatile uintptr_t)(uart_physbase + i*0x10);
				DBGOUT(KERN_INFO "men_uart_port.membase=0x%08x\n", men_uart_port.membase );
			}
#else /* 8250 API 3.7.x */
			men_uart_port.port.irq 	   		= chu->irq;
			men_uart_port.port.uartclk 		= baud_base * 16 ;
			men_uart_port.port.flags		= UPF_SKIP_TEST|UPF_SHARE_IRQ|UPF_BOOT_AUTOCONF;

			if( ioMapped ) {
				men_uart_port.port.iotype	= UPIO_PORT;
				men_uart_port.port.iobase	= (volatile unsigned long)(uart_physbase+i*0x10);
				DBGOUT(KERN_INFO "men_uart_port.iobase=0x%08x\n", men_uart_port.port.iobase );
			} else {
				men_uart_port.port.iotype	= UPIO_MEM;
				drvData->uartBase[i] 		= (volatile void*)ioremap_nocache((ulong)uart_physbase + i*0x10, 0x10 );
				men_uart_port.port.membase	= (char*)drvData->uartBase[i];
				men_uart_port.port.mapbase	= (volatile unsigned long)(uart_physbase + (i*0x10));
				DBGOUT(KERN_INFO "men_uart_port.membase=0x%08x .mapbase=0x%08x\n", men_uart_port.port.membase, men_uart_port.port.mapbase );
			}
#endif
			/* set differential mode and half duplex mode according to kernel parameter. Default: RS232 (single ended) */
			if(( G_menZ25Nr >= MEN_Z25_MAX_SETUP ) || ( !G_menZ25_mode[G_menZ25Nr] ))
				modeval = Z25_MODE_SE;
			else
				modeval = G_menZ25_mode[G_menZ25Nr];

			DBGOUT(KERN_INFO "16Z025 channel %d: mode=0x%02x\n", G_menZ25Nr, modeval );
			MEN_Z25_WRITEB( modeval, UART_8250_IOMEMBASE + 0x07);

			if( strcmp( fixed_type, "0" ) ) {
				DBGOUT("z25_probe: physBase=%p fixed_type PORT_16550A", uart_physbase);
				men_uart_port.port.flags |= UPF_FIXED_TYPE;
				men_uart_port.port.type = PORT_16550A;
			}

			if ((line = UART_8250_REGISTER_FUNC( &men_uart_port )) < 0) {
				printk( KERN_ERR "*** UART registering for 16Z025 UART %d failed\n", G_menZ25Nr);
			} else {
				drvData->line[i] = line;
				G_menZ25Nr++;
			}
		}
	}
	return 0;
}

/*******************************************************************/
/** PNP function for 16Z125 Quad UART
 *
 * This gets called when the chameleon PNP subsystem starts and
 * is called for each Z125 unit. 16Z125 UARTS are instantiated as
 * 1 true UART per FPGA Unit.
 *
 * \param chu	\IN Z125 unit found
 * \return 0 	on success or negative linux error number
 */
static int z125_probe( CHAMELEON_UNIT_T *chu )
{
	void *uart_physbase;
	int modeval=0, ioMapped=0;
	int line = 0;

	struct UART_8250_PORT_STRUCT   men_uart_port;

	MEN_Z25_DRVDATA_T *drvData;

	uart_physbase = chu->phys;

	DBGOUT("z125_probe: physBase=%p irq=%d baud_base=%d\n",
		   uart_physbase, chu->irq, baud_base );

	/*--- get storage for intermediate data ---*/
	drvData = kmalloc( sizeof(*drvData), GFP_KERNEL );
	chu->driver_data = drvData;

	if( !drvData ) {
		printk( KERN_ERR "z125_probe: no memory!\n");
		return -ENOMEM;
	}

	drvData->line[0] = -1;	/* no serial dev number assigned */

	/*--- are we io-mapped ? ---*/
	ioMapped = pci_resource_flags( chu->pdev, chu->bar ) & IORESOURCE_IO;
	DBGOUT( "bar=%d ioMapped=0x%x\n", chu->bar, ioMapped );

	memset( &men_uart_port, 0, sizeof(men_uart_port));

#if LINUX_VERSION_CODE < KERNEL_VERSION(3,7,0) /* new API */
	men_uart_port.irq 			= chu->irq;
	men_uart_port.flags 		= UPF_SKIP_TEST|UPF_SHARE_IRQ|UPF_BOOT_AUTOCONF;
	men_uart_port.uartclk 		= baud_base * 16;
	men_uart_port.regshift 		= 0;

	/* set address */
	if( ioMapped ) {
		men_uart_port.iotype		= UPIO_PORT;
		men_uart_port.iobase		= (volatile unsigned long)uart_physbase;
	} else {
		men_uart_port.iotype 		= UPIO_MEM;
		drvData->uartBase[0] 		= (volatile void*)ioremap_nocache((ulong)uart_physbase, 0x10 );
		men_uart_port.mapbase 		= (volatile resource_size_t)(volatile uintptr_t)uart_physbase;
		men_uart_port.membase 		= (unsigned char*)drvData->uartBase[0];
	}
#else /* 8250 API 3.7.x */
	men_uart_port.port.irq 	   		= chu->irq;
	men_uart_port.port.uartclk 		= baud_base * 16 ;
	men_uart_port.port.flags		= UPF_SKIP_TEST|UPF_SHARE_IRQ|UPF_BOOT_AUTOCONF;

	if( ioMapped ) {
		men_uart_port.port.iotype	= UPIO_PORT;
		men_uart_port.port.iobase	= (unsigned long)uart_physbase;
		DBGOUT(KERN_INFO "men_uart_port.port.iobase=0x%08x\n",
			   men_uart_port.port.iobase );
	} else {
		men_uart_port.port.iotype	= UPIO_MEM;
		drvData->uartBase[0] 	= (volatile void*)ioremap_nocache((ulong)uart_physbase, 0x10);
		men_uart_port.port.membase 	= (char*)drvData->uartBase[0];
		men_uart_port.port.mapbase 	= (volatile unsigned long)uart_physbase;
		DBGOUT(KERN_INFO "men_uart_port.port.membase=0x%08x\n",
			   men_uart_port.port.membase );
	}
#endif

	/*
	 * set differential mode and half duplex mode according to kernel parameter. Default:
	 * RS232 (single ended)
	 */
	if(( G_menZ25Nr >= MEN_Z25_MAX_SETUP) || (!G_menZ25_mode[G_menZ25Nr]))
		modeval = Z25_MODE_SE;
	else
		modeval = G_menZ25_mode[G_menZ25Nr];

	DBGOUT(KERN_INFO "16Z125 instance %d: mode=0x%02x\n", chu->instance, modeval );
	MEN_Z25_WRITEB( modeval, UART_8250_IOMEMBASE + 0x07);

	if( strcmp( fixed_type,"0" ) ) {
		DBGOUT("z125_probe: physBase=%p fixed_type PORT_16550A", uart_physbase);
		men_uart_port.port.flags |= UPF_FIXED_TYPE;
		men_uart_port.port.type = PORT_16550A;
	}

	if ((line = UART_8250_REGISTER_FUNC( &men_uart_port )) < 0) {
		printk( KERN_ERR "*** register_serial() for 16Z125 UART %d failed\n", G_menZ25Nr);
	} else {
		DBGOUT(KERN_INFO "16Z125 instance %d = /dev/ttyS%d\n", chu->instance, line );
		drvData->line[0] = line;
	}

	G_menZ25Nr++;

	return 0;
}

/*******************************************************************/
/** PNP Wrapper function for UART Registration
 *
 * This gets called when the chameleon PNP subsystem starts and
 * is called for each Z25/Z125 unit. The Function calls the specific
 * Registration depending if a Z25 or Z125 is found.
 *
 * \param chu	\IN 	z25 unit found
 * \return 		0 on success or negative linux error number
 */
static int uarts_probe( CHAMELEON_UNIT_T *chu )
{

	int retval = 0;

	/*
	 * necessary since pci irqs are not automatically enabled anymore.
	 * This needed to be worked around with "pci=routeirq" kernel parameter.
	 */
	retval = pci_enable_device(chu->pdev);
	if ( retval < 0) {
		printk(KERN_ERR " *** %s: error while pci_enable_device()\n");
		return retval;
	}

	switch (chu->modCode){
	case CHAMELEON_16Z025_UART:
		DBGOUT(KERN_INFO "Probing Z25 unit\n");
		retval 		= 	z25_probe(chu);
		break;

	case CHAMELEON_16Z057_UART:
		printk(KERN_INFO "Probing Z57 unit - override baud_base with 115200!\n");
		baud_base	=	115200;
		retval 		= 	z25_probe(chu);
		break;

	case CHAMELEON_16Z125_UART:
		DBGOUT(KERN_INFO "Probing Z125 unit\n");
		retval 		= z125_probe(chu);
		break;

	default:
		/* shouldnt happen since this is called for listed & found Modcodes */
		retval = -EINVAL;
		break;
	}

	return(retval);
}

/*******************************************************************/
/** PNP function to remove registered Z25 UARTs
 *
 * \param chu		\IN 16Z025 unit to remove
 * \return 0 on success or negative linux error number
 */
static int z25_remove( CHAMELEON_UNIT_T *chu )
{
	MEN_Z25_DRVDATA_T *drvData = chu->driver_data;
	int i;

	DBGOUT("z25_remove: physBase=%p irq=%d\n", chu->phys, chu->irq );

	if( drvData ){
		for( i=0; i<4; i++ ) {
			if( drvData->line[i] >= 0 ) {
				serial8250_unregister_port(drvData->line[i]);
				iounmap( drvData->uartBase[i] );
			}
		}
		iounmap( drvData->modeReg );
		kfree( drvData );
		chu->driver_data = NULL;
	}
	return 0;
}

/*******************************************************************/
/** PNP function to remove registered Z25 UARTs
 *
 * \param chu		\IN frodo unit to remove
 * \return 0 on success or negative linux error number
 */
static int z125_remove( CHAMELEON_UNIT_T *chu )
{
	MEN_Z25_DRVDATA_T *drvData = chu->driver_data;

	DBGOUT("z125_remove: physBase=%p irq=%d\n", chu->phys, chu->irq );

	if( drvData ){
		if( drvData->line[0] >= 0 ) {
			serial8250_unregister_port(drvData->line[0]);
			iounmap( drvData->uartBase[0] );
		}
		kfree( drvData );
		chu->driver_data = NULL;
	}
	return 0;
}

/*******************************************************************/
/** helper to remove UART from kernel during unload
 *
 */
static int uarts_remove( CHAMELEON_UNIT_T *chu )
{
	if (chu->modCode == CHAMELEON_16Z025_UART){
		return z25_remove(chu);
	}
	else if (chu->modCode == CHAMELEON_16Z125_UART) {
		return z125_remove(chu);
	}
	else {
		return -ENODEV;
	}
}

/*******************************************************************/
/** Setup G_menZ25_mode array according to passed string
 *
 */
static int __init z025_setup( char *str )
{
	char buf[MODE_MAX_LEN];
	char *s,*t;
	int i = 0;

	memset( buf, 0x0, sizeof(buf));
	strncpy( buf, str, MODE_MAX_LEN-1 );
	buf[MODE_MAX_LEN-1] = '\0';
	s = buf;
	DBGOUT("men_13z025_setup: mode='%s'\n", s );

	if( *s=='\0' )
		return 1; /* empty string */

	while( 1 ) {
		/*
		 * accept ' ' (space) or ',' (comma) as delimiters
		 */
		if( ((t = strchr( s, ',' )) != NULL) ||  ((t = strchr( s, ' ' )) != NULL))
			*t = '\0';			/* replace ',' by \0, chopping the modeline */

		if( i < MEN_Z25_MAX_SETUP ){
			if( !strcmp( s, "se" ))
				G_menZ25_mode[i] = Z25_MODE_SE;
			else if( !strncmp( s, "df_fdx",  6 ))
				G_menZ25_mode[i] = Z25_MODE_FDX;
			else if( !strncmp( s, "df_hdxe", 7 ))
				G_menZ25_mode[i] = Z25_MODE_HDXE;
			else if( !strncmp( s, "df_hdx",  6 ))
				G_menZ25_mode[i] = Z25_MODE_HDX;
			else {
				printk( KERN_ERR "*** Frodo %d: illegal mode '%s'\n", i, str );
			}
			i++;
		}
		if( t == NULL )
			break;

		s = t + 1;

		/* break if max. modeline length reached */
		if (s > buf + MODE_MAX_LEN) {
			printk( KERN_INFO "*** max. mode line length reached!\n" );
			break;
		}
	}
	return 1;
}

/*******************************************************************/
/** module init function
 */
static int __init uarts_serial_init(void)
{
#ifdef MODULE
	z025_setup( mode );		/* pass module parameter */
#endif
	men_chameleon_register_driver( &G_driver );
	return 0;
}

/**********************************************************************/
/** Driver's cleanup routine
 */
static void __exit uarts_serial_cleanup(void)
{
	DBGOUT("uarts_serial_cleanup\n");
	men_chameleon_unregister_driver( &G_driver );
}

/* called when statically linked into kernel */
__setup( "z025_mode=", z025_setup );

/*--------------------------------------------------------------------------*/
module_init(uarts_serial_init);
module_exit(uarts_serial_cleanup);

MODULE_LICENSE( "GPL" );
MODULE_DESCRIPTION( "MEN Z25/125 UART Stub driver for serial.c" );
MODULE_AUTHOR("Thomas Schnuerer <thomas.schnuerer@men.de>");
MODULE_VERSION( MENT_XSTR(MAK_REVISION) );
