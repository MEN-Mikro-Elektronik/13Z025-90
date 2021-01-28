<?xml version='1.0' encoding='ISO-8859-1' standalone='yes'?>
<tagfile>
  <compound kind="page">
    <filename>index</filename>
    <title>Linux native driver for MEN Chameleon FPGA driver/device registration.</title>
    <name>index</name>
  </compound>
  <compound kind="file">
    <name>chameleon.h</name>
    <path>/opt/menlinux/INCLUDE/COM/MEN/</path>
    <filename>chameleon_8h</filename>
    <class kind="struct">CHAM_FUNCTBL</class>
    <class kind="struct">CHAMELEON_UNIT</class>
    <class kind="struct">CHAMELEONV2_BA</class>
    <class kind="struct">CHAMELEONV2_BRIDGE</class>
    <class kind="struct">CHAMELEONV2_CPU</class>
    <class kind="struct">CHAMELEONV2_FIND</class>
    <class kind="struct">CHAMELEONV2_INFO</class>
    <class kind="struct">CHAMELEONV2_TABLE</class>
    <class kind="struct">CHAMELEONV2_UNIT</class>
    <class kind="struct">FPGA_HEADER_INFO</class>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_PCIDEV_ILL</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_PCIDEV_ERR</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_TABLE_NOT_FOUND</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_TABLE_REV_UNSUP</name>
      <anchor>a3</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_TABLE_ERR</name>
      <anchor>a4</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_DTYPE_UNSUP</name>
      <anchor>a5</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BAR_UNASSIGNED</name>
      <anchor>a6</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BARDESC_MISSING</name>
      <anchor>a7</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_HANDLE_ILL</name>
      <anchor>a8</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_OUT_OF_RES</name>
      <anchor>a9</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_NO_MORE_ENTRIES</name>
      <anchor>a10</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_UNIT_FOUND</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BRIDGE_FOUND</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_CPU_FOUND</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEON_MAGIC_00</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEON_MAGIC_01</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEON_MAGIC_02</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BUSTYPE_WB</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BUSTYPE_AV</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BUSTYPE_LPC</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BUSTYPE_ISA</name>
      <anchor>a3</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_FF_BRGALL</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_FILENAME_SIZE</name>
      <anchor>a117</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>void</type>
      <name>CHAMELEONV2_HANDLE</name>
      <anchor>a133</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>men_chameleon.h</name>
    <path>/opt/menlinux/INCLUDE/NATIVE/MEN/</path>
    <filename>men__chameleon_8h</filename>
    <class kind="struct">CHAMELEON_DRIVER_T</class>
    <class kind="struct">CHAMELEON_UNIT_T</class>
    <class kind="struct">CHAMELEONV2_DRIVER_T</class>
    <class kind="struct">CHAMELEONV2_UNIT_T</class>
    <member kind="typedef">
      <type>CHAMELEON_DRIVER_T</type>
      <name>CHAMELEON_DRIVER_T</name>
      <anchor>a3</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>CHAMELEONV2_DRIVER_T</type>
      <name>CHAMELEONV2_DRIVER_T</name>
      <anchor>a4</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>men_z25_serial.c</name>
    <path>/opt/menlinux/DRIVERS/13Z025/</path>
    <filename>men__z25__serial_8c</filename>
    <class kind="struct">MEN_Z25_DRVDATA_T</class>
    <member kind="function" static="yes">
      <type>int</type>
      <name>uarts_probe</name>
      <anchor>a24</anchor>
      <arglist>(CHAMELEON_UNIT_T *chu)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>int</type>
      <name>uarts_remove</name>
      <anchor>a25</anchor>
      <arglist>(CHAMELEON_UNIT_T *chu)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>int</type>
      <name>z25_probe</name>
      <anchor>a34</anchor>
      <arglist>(CHAMELEON_UNIT_T *chu)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>int</type>
      <name>z125_probe</name>
      <anchor>a35</anchor>
      <arglist>(CHAMELEON_UNIT_T *chu)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>int</type>
      <name>z25_remove</name>
      <anchor>a36</anchor>
      <arglist>(CHAMELEON_UNIT_T *chu)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>int</type>
      <name>z125_remove</name>
      <anchor>a37</anchor>
      <arglist>(CHAMELEON_UNIT_T *chu)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>int __init</type>
      <name>z025_setup</name>
      <anchor>a38</anchor>
      <arglist>(char *str)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>int __init</type>
      <name>uarts_serial_init</name>
      <anchor>a39</anchor>
      <arglist>(void)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>void __exit</type>
      <name>uarts_serial_cleanup</name>
      <anchor>a40</anchor>
      <arglist>(void)</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>int</type>
      <name>G_menZ25Nr</name>
      <anchor>a15</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>char *</type>
      <name>mode</name>
      <anchor>a19</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>men_z25_serial_doc.c</name>
    <path>/opt/menlinux/DRIVERS/13Z025/</path>
    <filename>men__z25__serial__doc_8c</filename>
  </compound>
  <compound kind="struct">
    <name>CHAM_FUNCTBL</name>
    <filename>structCHAM__FUNCTBL.html</filename>
    <member kind="variable">
      <type>int32(*</type>
      <name>InitPci</name>
      <anchor>o0</anchor>
      <arglist>)(OSS_HANDLE *osh, u_int32 pciBus, u_int32 pciDev, u_int32 pciFunc, CHAMELEONV2_HANDLE **chahP)</arglist>
    </member>
    <member kind="variable">
      <type>int32(*</type>
      <name>InitInside</name>
      <anchor>o1</anchor>
      <arglist>)(OSS_HANDLE *osh, void *tblAddr, CHAMELEONV2_HANDLE **chahP)</arglist>
    </member>
    <member kind="variable">
      <type>int32(*</type>
      <name>Info</name>
      <anchor>o2</anchor>
      <arglist>)(CHAMELEONV2_HANDLE *chah, CHAMELEONV2_INFO *info)</arglist>
    </member>
    <member kind="variable">
      <type>int32(*</type>
      <name>TableIdent</name>
      <anchor>o3</anchor>
      <arglist>)(CHAMELEONV2_HANDLE *chah, u_int32 idx, CHAMELEONV2_TABLE *table)</arglist>
    </member>
    <member kind="variable">
      <type>int32(*</type>
      <name>UnitIdent</name>
      <anchor>o4</anchor>
      <arglist>)(CHAMELEONV2_HANDLE *chah, u_int32 idx, CHAMELEONV2_UNIT *unit)</arglist>
    </member>
    <member kind="variable">
      <type>int32(*</type>
      <name>BridgeIdent</name>
      <anchor>o5</anchor>
      <arglist>)(CHAMELEONV2_HANDLE *chah, u_int32 idx, CHAMELEONV2_BRIDGE *bridge)</arglist>
    </member>
    <member kind="variable">
      <type>int32(*</type>
      <name>CpuIdent</name>
      <anchor>o6</anchor>
      <arglist>)(CHAMELEONV2_HANDLE *chah, u_int32 idx, CHAMELEONV2_CPU *cpu)</arglist>
    </member>
    <member kind="variable">
      <type>int32(*</type>
      <name>InstanceFind</name>
      <anchor>o7</anchor>
      <arglist>)(CHAMELEONV2_HANDLE *chah, int32 idx, CHAMELEONV2_FIND find, CHAMELEONV2_UNIT *unit, CHAMELEONV2_BRIDGE *bridge, CHAMELEONV2_CPU *cpu)</arglist>
    </member>
    <member kind="variable">
      <type>void(*</type>
      <name>Term</name>
      <anchor>o8</anchor>
      <arglist>)(CHAMELEONV2_HANDLE **chahP)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEON_DRIVER_T</name>
    <filename>structCHAMELEON__DRIVER__T.html</filename>
    <member kind="variable">
      <type>list_head</type>
      <name>node</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const char *</type>
      <name>name</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const u16 *</type>
      <name>modCodeArr</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int(*</type>
      <name>probe</name>
      <anchor>o3</anchor>
      <arglist>)(CHAMELEON_UNIT_T *unit)</arglist>
    </member>
    <member kind="variable">
      <type>int(*</type>
      <name>remove</name>
      <anchor>o4</anchor>
      <arglist>)(CHAMELEON_UNIT_T *unit)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEON_UNIT</name>
    <filename>structCHAMELEON__UNIT.html</filename>
    <member kind="variable">
      <type>u_int16</type>
      <name>modCode</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>revision</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>instance</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>interrupt</name>
      <anchor>o3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>bar</name>
      <anchor>o4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>offset</name>
      <anchor>o6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>void *</type>
      <name>addr</name>
      <anchor>o7</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEON_UNIT_T</name>
    <filename>structCHAMELEON__UNIT__T.html</filename>
    <member kind="variable">
      <type>u16</type>
      <name>modCode</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u16</type>
      <name>revision</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>instance</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>irq</name>
      <anchor>o3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>bar</name>
      <anchor>o4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u32</type>
      <name>offset</name>
      <anchor>o5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>void *</type>
      <name>phys</name>
      <anchor>o6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>chamNum</name>
      <anchor>o7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>pci_dev *</type>
      <name>pdev</name>
      <anchor>o8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>void *</type>
      <name>driver_data</name>
      <anchor>o9</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>CHAMELEON_DRIVER_T *</type>
      <name>driver</name>
      <anchor>o10</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEONV2_BA</name>
    <filename>structCHAMELEONV2__BA.html</filename>
    <member kind="variable">
      <type>u_int32</type>
      <name>addr</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>size</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int8</type>
      <name>type</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEONV2_BRIDGE</name>
    <filename>structCHAMELEONV2__BRIDGE.html</filename>
    <member kind="variable">
      <type>u_int16</type>
      <name>devId</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>variant</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>revision</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>busId</name>
      <anchor>o3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>instance</name>
      <anchor>o4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>nextBus</name>
      <anchor>o5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>interrupt</name>
      <anchor>o6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>bar</name>
      <anchor>o7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>dbar</name>
      <anchor>o8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>group</name>
      <anchor>o9</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>offset</name>
      <anchor>o10</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>size</name>
      <anchor>o11</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>void *</type>
      <name>addr</name>
      <anchor>o12</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEONV2_CPU</name>
    <filename>structCHAMELEONV2__CPU.html</filename>
    <member kind="variable">
      <type>u_int16</type>
      <name>devId</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>variant</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>revision</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>busId</name>
      <anchor>o3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>instance</name>
      <anchor>o4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>group</name>
      <anchor>o5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>interrupt</name>
      <anchor>o6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>bootAddr</name>
      <anchor>o8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>reserved</name>
      <anchor>o9</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEONV2_DRIVER_T</name>
    <filename>structCHAMELEONV2__DRIVER__T.html</filename>
    <member kind="variable">
      <type>list_head</type>
      <name>node</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const char *</type>
      <name>name</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const u16 *</type>
      <name>devIdArr</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int(*</type>
      <name>probe</name>
      <anchor>o3</anchor>
      <arglist>)(CHAMELEONV2_UNIT_T *unit)</arglist>
    </member>
    <member kind="variable">
      <type>int(*</type>
      <name>remove</name>
      <anchor>o4</anchor>
      <arglist>)(CHAMELEONV2_UNIT_T *unit)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEONV2_FIND</name>
    <filename>structCHAMELEONV2__FIND.html</filename>
    <member kind="variable">
      <type>int16</type>
      <name>devId</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int16</type>
      <name>variant</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int16</type>
      <name>instance</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int16</type>
      <name>busId</name>
      <anchor>o3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int16</type>
      <name>group</name>
      <anchor>o4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>flags</name>
      <anchor>o5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int32</type>
      <name>bootAddr</name>
      <anchor>o6</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEONV2_INFO</name>
    <filename>structCHAMELEONV2__INFO.html</filename>
    <member kind="variable">
      <type>u_int16</type>
      <name>chaRev</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>busId</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>tableNbr</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>unitNbr</name>
      <anchor>o3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>bridgeNbr</name>
      <anchor>o4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>cpuNbr</name>
      <anchor>o5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>CHAMELEONV2_BA</type>
      <name>ba</name>
      <anchor>o6</anchor>
      <arglist>[6]</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEONV2_TABLE</name>
    <filename>structCHAMELEONV2__TABLE.html</filename>
    <member kind="variable">
      <type>u_int16</type>
      <name>busType</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>busId</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>char</type>
      <name>model</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>revision</name>
      <anchor>o3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>char</type>
      <name>file</name>
      <anchor>o4</anchor>
      <arglist>[CHAMELEONV2_FILENAME_SIZE]</arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>magicWord</name>
      <anchor>o5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>minRevision</name>
      <anchor>o6</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEONV2_UNIT</name>
    <filename>structCHAMELEONV2__UNIT.html</filename>
    <member kind="variable">
      <type>u_int16</type>
      <name>devId</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>variant</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>revision</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>busId</name>
      <anchor>o3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>instance</name>
      <anchor>o4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>group</name>
      <anchor>o5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>interrupt</name>
      <anchor>o6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>bar</name>
      <anchor>o7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>offset</name>
      <anchor>o8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>size</name>
      <anchor>o9</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>void *</type>
      <name>addr</name>
      <anchor>o10</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>reserved</name>
      <anchor>o11</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEONV2_UNIT_T</name>
    <filename>structCHAMELEONV2__UNIT__T.html</filename>
    <member kind="variable">
      <type>CHAMELEONV2_UNIT</type>
      <name>unitFpga</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>chamNum</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>pci_dev *</type>
      <name>pdev</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>void *</type>
      <name>driver_data</name>
      <anchor>o3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>CHAMELEONV2_DRIVER_T *</type>
      <name>driver</name>
      <anchor>o4</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>FPGA_HEADER_INFO</name>
    <filename>structFPGA__HEADER__INFO.html</filename>
  </compound>
  <compound kind="struct">
    <name>MEN_Z25_DRVDATA_T</name>
    <filename>structMEN__Z25__DRVDATA__T.html</filename>
  </compound>
  <compound kind="page">
    <name>z25dummy</name>
    <title>MEN logo</title>
    <filename>z25dummy</filename>
  </compound>
  <compound kind="group">
    <name>_CHAMV2_ERRCODES</name>
    <title>Chameleon-V2 Error Codes</title>
    <filename>group____CHAMV2__ERRCODES.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_PCIDEV_ILL</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_PCIDEV_ERR</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_TABLE_NOT_FOUND</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_TABLE_REV_UNSUP</name>
      <anchor>a3</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_TABLE_ERR</name>
      <anchor>a4</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_DTYPE_UNSUP</name>
      <anchor>a5</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BAR_UNASSIGNED</name>
      <anchor>a6</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BARDESC_MISSING</name>
      <anchor>a7</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_HANDLE_ILL</name>
      <anchor>a8</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_OUT_OF_RES</name>
      <anchor>a9</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_NO_MORE_ENTRIES</name>
      <anchor>a10</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>_CHAMV2_SUCCCODES</name>
    <title>Chameleon-V2 Success Codes</title>
    <filename>group____CHAMV2__SUCCCODES.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_UNIT_FOUND</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BRIDGE_FOUND</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_CPU_FOUND</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>_CHAM_MAGICWORD</name>
    <title>Chameleon Magic Words</title>
    <filename>group____CHAM__MAGICWORD.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEON_MAGIC_00</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEON_MAGIC_01</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEON_MAGIC_02</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>_CHAMV2_BUSTYPE</name>
    <title>Chameleon-V2 Bus Types</title>
    <filename>group____CHAMV2__BUSTYPE.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BUSTYPE_WB</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BUSTYPE_AV</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BUSTYPE_LPC</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BUSTYPE_ISA</name>
      <anchor>a3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>_CHAMV2_FF</name>
    <title>Chameleon-V2 InstanceFind() Flags</title>
    <filename>group____CHAMV2__FF.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_FF_BRGALL</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
  </compound>
</tagfile>
