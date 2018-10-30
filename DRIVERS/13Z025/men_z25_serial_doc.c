/*********************  P r o g r a m  -  M o d u l e ***********************/
/*!
 *        \file  frodo_serial_doc.c
 *
 *      \author  thomas.schnuerer@men.de
 *        $Date: 2013/07/31 16:41:41 $
 *    $Revision: 1.6 $
 *
 *      \brief   User documentation for MEN Chameleon UART FPGA driver/device
 *               registration
 *
 *     Required: -
 *
 *     \switches -
 */
 /*
 *---------------------------------------------------------------------------
 * (c) Copyright 2004 by MEN Mikro Elektronik GmbH, Nuremberg, Germany
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

/*! \mainpage Linux native driver for MEN Chameleon FPGA driver/device registration.

    The men_lx_frodo Linux kernel module is the stub driver for registering
    MEN FPGA Uarts to the kernels serial core driver. The Units supported are
    16Z025, 16Z057 and 16Z125. These UARTS are compatible to the
    classic 16550 UARTs.
	
	\n \section installation Driver Build and Installation

	The men_lx_frodo driver is primarily intended to be built together with 
    the MDIS system Package.

	\subsection installation_mdis Build using MEN MDIS framework


	When using the ElinOS and MEN MDIS environments, the driver can be built
	and	installed just by adding the MDIS makefile \n

	\$(MEN_LIN_DIR)/DRIVERS/CHAMELEON/driver.mak \n

    to the
	\$(ELINOS_PROJECT)/src/mdis/Makefile under the ALL_NATIVE_DRIVERS entry.
	The drivers object file is installed properly into the ElinOS environment
	(path: \$(ELINOS_PROJECT)/kernel.rootfs/lib/modules/\$(LINUX_VERSION)/misc).    \n

    If you are using the MEN MDIS Configuration Wizard (MDISWIZ) the driver is
    automatically built if a device is configured which needs it.

	\n \section parameter Parameter

	The FPGA UART Driver takes 2 Parameters:

	\subsection baud_base System Clock setting

	On the EM01 the base_baud clock is slightly different:
	baud_base=4142857 ( = 132,571MHz/32 ) due to different needed
	clock frequencies for other IP cores in these CPUs (framebuffer etc.)

	When passing an other than the standard Clock, pass it on 
	baud_base=value
	If the Value is omitted, the standard UART clock (33333333) is used.
	\n

	\subsection units Necessary Clock setting for special UART Units

	Due to certain previous Developments there are several different UART units
	that may be built in the FPGA for which this driver is used. The previous explanations
	match for the 16Z025 and 16Z125 Units, while the 16Z057 Unit is a special case:
	It internally just accepts "classic" Divisor settings that are derived from a baud base of
	115200, independent of the true PCI frequency. So, for an FPGA containing this unit the
	Parameter baud_base is automatically corrected to baud_base=115200, this is reported
	in the kernel messages (available with dmesg)
	
	\subsection mode physical Mode setting	

	When no mode parameter is passed, the default physical setting is single ended (RS232)

	The physical line mode can be passed as a kernel or module parameter:
 
	Module parameter (Kernel 2.4): mode="mode mode mode mode" \n
	Module parameter (Kernel 2.6): mode=mode,mode,mode,mode \n
 
	Where each <mode> specifies the physical line mode of the nth frodo IF
	and can be:
	- se 		- single ended (RS232), the default
	- df_fdx  	- differential, full duplex
	- df_hdxe	- differential, half duplex, with echo
	- df_hdx	- differential, half duplex, echo suppressed
 
	Example: for usage of F210 UARTs add a line to /etc/inittab like this:
	modprobe men_lx_frodo mode="se,se,se,se,se"
	to get the additional UARTs registered.

	\n \section kerparinfo Important kernelparameters and BIOS settings for x86 Boards

	In the current driver Version APIC support (Advanced Peripheral Interrupt Controller)
	is not included so its necessary to turn the APIC off in the BIOS. The Reason is that the
	IRQ number of the FPGA in the Chameleon PCI Header is not equal to that used in the kernel
	at runtime. The following dump shows the registered Interrupt handlers when APIC is not used.
	Then the standard XT-PIC handles the devices at their original IRQ number from PCI Space.

	\verbatim
	           CPU0       
		   0:     104010          XT-PIC  timer
		   2:          0          XT-PIC  cascade
		   3:       1349          XT-PIC  uhci_hcd:usb1, ehci_hcd:usb5
		   5:        665          XT-PIC  uhci_hcd:usb4, HDA Intel
		   7:         43          XT-PIC  serial 
		   9:          0          XT-PIC  acpi
		   10:          0          XT-PIC  uhci_hcd:usb3
		   11:       5323          XT-PIC  libata, uhci_hcd:usb2, eth1
		   NMI:          0 
		   LOC:     103893 
		   ERR:          0
		   MIS:          0
	\endverbatim


	APIC support is planned for a future Release of the MDIS System package.
	
	When the module is properly built and the module dependencies are 
	generated with depmod, the Driver can be loaded via modprobe. The Driver 
	depends on the core chameleon library which is reflected by the 
	"Used by" field of the lsmod command: 

\verbatim
 #> lsmod
 Module                  Size  Used by
 men_lx_frodo            3520  0 
 men_lx_chameleon        5016  1 men_lx_frodo
 men_chameleon          10640  1 men_lx_chameleon
 men_oss                16112  2 men_lx_chameleon,men_chameleon
\endverbatim
	\n \section kernelsettings Necessary Kernel settings

    Problems can occur if a FPGA contains many (> 4) UARTs and the 
    CPU itself already contains COM ports which is usually the case. Then
    the kernel must be configured such that the support for more than 4 UARTs
    is enabled. A tested Kernel Configuration example contains the section
    shown below in the linux/.config File:
    
\verbatim
 #
 # Serial drivers
 #
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=10
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_MANY_PORTS=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
\endverbatim

    \n \section newpar Specifying nr. of UARTs as kernel parameter
    since late 2.6 kernels there is a more convenient method available to specify how much
    UARTs shall be initialized upon boot time. The kernel parameter nr_uarts lets the user
    specify this. It must be added e.g. in the GRUB boot loader to be passed as a kernel
    parameter. Since the 8250 core driver is almost always statically compiled in the used
    kernel, the dot notation for the module parameter has to be used:
\verbatim    
    8250.nr_uarts=64    
\endverbatim

    \n \section Serial Port Naming / Assigment under Linux    
    Care should be taken when using Uart devices across different HW Platforms.
    The device nodes assigned to the additional UARTs can vary, and might not
    follow the last On-Chip COM Port in a linear order. For example, If an
    x86 CPU contains 2 devices (/dev/ttyS0 and /dev/ttyS1) the new serial
    Ports are assigned as as /dev/ttyS4 until /dev/ttyS7.
	So, a sufficient number of Device node entries in /dev/ must exist too,
    the entries must look like this (Major number 4, Minors starting at 
    64):
\verbatim
 -sh-3.00# l /dev/ttyS*
 crw-rw----  1 root root 4, 64 Jan 30  2007 /dev/ttyS0
 crw-rw----  1 root root 4, 65 Jan 30  2007 /dev/ttyS1
 crw-rw----  1 root root 4, 66 Jan 30  2007 /dev/ttyS2
 crw-rw----  1 root root 4, 67 Jan 30  2007 /dev/ttyS3
 crw-r--r--  1 root root 4, 68 Aug 14 01:48 /dev/ttyS4
 crw-r--r--  1 root root 4, 69 Aug 14 01:51 /dev/ttyS5
 crw-r--r--  1 root root 4, 70 Aug 11 00:07 /dev/ttyS6
 crw-r--r--  1 root root 4, 71 Aug 14 01:49 /dev/ttyS7
 crw-r--r--  1 root root 4, 72 Aug 14 01:06 /dev/ttyS8
\endverbatim

    See the Linux Serial-HOWTO for more info.

*/


/** \page dummy
  \menimages
*/
 
