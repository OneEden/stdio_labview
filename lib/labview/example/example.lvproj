<?xml version='1.0'?>
<Project Type="Project" LVVersion="8208000">
   <Item Name="My Computer" Type="My Computer">
      <Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
      <Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
      <Property Name="server.tcp.enabled" Type="Bool">false</Property>
      <Property Name="server.tcp.port" Type="Int">0</Property>
      <Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
      <Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
      <Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
      <Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
      <Property Name="specify.custom.address" Type="Bool">false</Property>
      <Item Name="CallWithInput.vi" Type="VI" URL="CallWithInput.vi"/>
      <Item Name="HelloWorld.vi" Type="VI" URL="HelloWorld.vi"/>
      <Item Name="Event.vi" Type="VI" URL="Event.vi"/>
      <Item Name="CallWithOutput.vi" Type="VI" URL="CallWithOutput.vi"/>
      <Item Name="CallWithInputAndOutput.vi" Type="VI" URL="CallWithInputAndOutput.vi"/>
      <Item Name="Dependencies" Type="Dependencies"/>
      <Item Name="Build Specifications" Type="Build">
         <Item Name="export_lv82" Type="DLL">
            <Property Name=".NET" Type="Bool">false</Property>
            <Property Name="Absolute[0]" Type="Bool">false</Property>
            <Property Name="Absolute[1]" Type="Bool">false</Property>
            <Property Name="Absolute[2]" Type="Bool">false</Property>
            <Property Name="AliasID" Type="Str">{296C629B-F8D3-4BF7-93FA-3D548BD4154D}</Property>
            <Property Name="AliasName" Type="Str">Project.aliases</Property>
            <Property Name="AutoIncrement" Type="Bool">false</Property>
            <Property Name="BuildName" Type="Str">export_lv82</Property>
            <Property Name="CopyErrors" Type="Bool">false</Property>
            <Property Name="DebuggingDLL" Type="Bool">false</Property>
            <Property Name="DebugServerWaitOnLaunch" Type="Bool">true</Property>
            <Property Name="DefaultLanguage" Type="Str">English</Property>
            <Property Name="DelayOSMsg" Type="Bool">true</Property>
            <Property Name="DependencyApplyDestination" Type="Bool">true</Property>
            <Property Name="DependencyApplyInclusion" Type="Bool">true</Property>
            <Property Name="DependencyApplyProperties" Type="Bool">true</Property>
            <Property Name="DependencyFolderDestination" Type="Int">0</Property>
            <Property Name="DependencyFolderInclusion" Type="Str">As Needed</Property>
            <Property Name="DependencyFolderPropertiesItemCount" Type="Int">0</Property>
            <Property Name="DestinationID[0]" Type="Str">{878DD9A2-DE81-4BC6-B586-06E7673E3421}</Property>
            <Property Name="DestinationID[1]" Type="Str">{878DD9A2-DE81-4BC6-B586-06E7673E3421}</Property>
            <Property Name="DestinationID[2]" Type="Str">{1C3978D2-90FA-4144-AB19-0C62E9050B5C}</Property>
            <Property Name="DestinationItemCount" Type="Int">3</Property>
            <Property Name="DestinationName[0]" Type="Str">example.dll</Property>
            <Property Name="DestinationName[1]" Type="Str">Destination Directory</Property>
            <Property Name="DestinationName[2]" Type="Str">Support Directory</Property>
            <Property Name="Disconnect" Type="Bool">true</Property>
            <Property Name="EmbeddedRTE" Type="Bool">false</Property>
            <Property Name="HID" Type="Str">{B284748B-66DC-434B-823A-9C2F356D96DE}</Property>
            <Property Name="IncludeHeaders" Type="Bool">true</Property>
            <Property Name="IncludeHWConfig" Type="Bool">false</Property>
            <Property Name="IncludeSCC" Type="Bool">true</Property>
            <Property Name="INIID" Type="Str">{01D7AA04-DE7A-463E-BE12-29AD8F72537B}</Property>
            <Property Name="LIBID" Type="Str">{30AD9136-8FA2-45E4-9D36-DB49580AB43A}</Property>
            <Property Name="ManagedClassName" Type="Str"></Property>
            <Property Name="ManagedClassNamespace" Type="Str"></Property>
            <Property Name="MathScript" Type="Bool">false</Property>
            <Property Name="Path[0]" Type="Path">../../builds/example/export_lv82/internal.llb</Property>
            <Property Name="Path[1]" Type="Path">../../builds/example/export_lv82</Property>
            <Property Name="Path[2]" Type="Path">../../builds/example/export_lv82/data</Property>
            <Property Name="SharedLibraryID" Type="Str">{86AC5779-CA91-4C82-9084-55729A6D0676}</Property>
            <Property Name="SharedLibraryName" Type="Str">example.dll</Property>
            <Property Name="ShowHWConfig" Type="Bool">false</Property>
            <Property Name="SourceInfoItemCount" Type="Int">5</Property>
            <Property Name="SourceItem[0].FolderInclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[0].Inclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[0].ItemID" Type="Ref">/My Computer/CallWithInput.vi</Property>
            <Property Name="SourceItem[0].VIProtoInfo[0]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[0]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[0]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[0]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[0]VIProtoName" Type="Str">return value</Property>
            <Property Name="SourceItem[0].VIProtoInfo[0]VIProtoOutputIdx" Type="Int">3</Property>
            <Property Name="SourceItem[0].VIProtoInfo[0]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[1]VIProtoDir" Type="Int">0</Property>
            <Property Name="SourceItem[0].VIProtoInfo[1]VIProtoInputIdx" Type="Int">11</Property>
            <Property Name="SourceItem[0].VIProtoInfo[1]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[1]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[1]VIProtoName" Type="Str">Input</Property>
            <Property Name="SourceItem[0].VIProtoInfo[1]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[1]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[2]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[2]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[2]VIProtoLenInput" Type="Int">3</Property>
            <Property Name="SourceItem[0].VIProtoInfo[2]VIProtoLenOutput" Type="Int">3</Property>
            <Property Name="SourceItem[0].VIProtoInfo[2]VIProtoName" Type="Str">MessageOut</Property>
            <Property Name="SourceItem[0].VIProtoInfo[2]VIProtoOutputIdx" Type="Int">2</Property>
            <Property Name="SourceItem[0].VIProtoInfo[2]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]CallingConv" Type="Int">1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]Name" Type="Str">CallWithInput</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]VIProtoDir" Type="Int">3</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]VIProtoName" Type="Str">len</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]VIProtoPassBy" Type="Int">0</Property>
            <Property Name="SourceItem[0].VIProtoInfoCPTM" Type="Bin">###!!A!!!!5!"!!!!"2!-0````]+476T=W&amp;H:5^V&gt;!!!$%!$"F.U982V=Q!!$E!Q`````Q6*&lt;H"V&gt;!!]!0!!$!!!!!!!!1!#!!!!!!!!!!!!!!!!!!!!!Q-!!(A!!!!!#1!*!!!!!!!!!!!!!!!!!!!!#!!!!!!"!!1</Property>
            <Property Name="SourceItem[0].VIProtoInfoVIProtoItemCount" Type="Int">4</Property>
            <Property Name="SourceItem[1].FolderInclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[1].Inclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[1].ItemID" Type="Ref">/My Computer/HelloWorld.vi</Property>
            <Property Name="SourceItem[1].VIProtoInfo[0]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[0]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[0]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[0]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[0]VIProtoName" Type="Str">return value</Property>
            <Property Name="SourceItem[1].VIProtoInfo[0]VIProtoOutputIdx" Type="Int">3</Property>
            <Property Name="SourceItem[1].VIProtoInfo[0]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[1]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[1]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[1]VIProtoLenInput" Type="Int">2</Property>
            <Property Name="SourceItem[1].VIProtoInfo[1]VIProtoLenOutput" Type="Int">2</Property>
            <Property Name="SourceItem[1].VIProtoInfo[1]VIProtoName" Type="Str">Message</Property>
            <Property Name="SourceItem[1].VIProtoInfo[1]VIProtoOutputIdx" Type="Int">2</Property>
            <Property Name="SourceItem[1].VIProtoInfo[1]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]CallingConv" Type="Int">1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]Name" Type="Str">HelloWorld</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]VIProtoDir" Type="Int">3</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]VIProtoName" Type="Str">len</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]VIProtoPassBy" Type="Int">0</Property>
            <Property Name="SourceItem[1].VIProtoInfoCPTM" Type="Bin">###!!A!!!!1!"!!!!""!-0````](476T=W&amp;H:1!-1!-'5X2B&gt;(6T!!!]!0!!$!!!!!!!!1!#!!!!!!!!!!!!!!!!!!!!!!-!!(A!!!!!#1!*!!!!!!!!!!!!!!!!!!!!!!!!!!!"!!-</Property>
            <Property Name="SourceItem[1].VIProtoInfoVIProtoItemCount" Type="Int">3</Property>
            <Property Name="SourceItem[2].FolderInclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[2].Inclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[2].ItemID" Type="Ref">/My Computer/Event.vi</Property>
            <Property Name="SourceItem[2].VIProtoInfo[0]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[0]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[0]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[0]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[0]VIProtoName" Type="Str">return value</Property>
            <Property Name="SourceItem[2].VIProtoInfo[0]VIProtoOutputIdx" Type="Int">3</Property>
            <Property Name="SourceItem[2].VIProtoInfo[0]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[1]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[1]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[1]VIProtoLenInput" Type="Int">2</Property>
            <Property Name="SourceItem[2].VIProtoInfo[1]VIProtoLenOutput" Type="Int">2</Property>
            <Property Name="SourceItem[2].VIProtoInfo[1]VIProtoName" Type="Str">Message</Property>
            <Property Name="SourceItem[2].VIProtoInfo[1]VIProtoOutputIdx" Type="Int">2</Property>
            <Property Name="SourceItem[2].VIProtoInfo[1]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]CallingConv" Type="Int">1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]Name" Type="Str">Event</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]VIProtoDir" Type="Int">3</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]VIProtoName" Type="Str">len</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]VIProtoPassBy" Type="Int">0</Property>
            <Property Name="SourceItem[2].VIProtoInfoCPTM" Type="Bin">###!!A!!!!1!"!!!!""!-0````](476T=W&amp;H:1!-1!-'5X2B&gt;(6T!!!]!0!!$!!!!!!!!1!#!!!!!!!!!!!!!!!!!!!!!!-!!(A!!!!!#1!*!!!!!!!!!!!!!!!!!!!!!!!!!!!"!!-</Property>
            <Property Name="SourceItem[2].VIProtoInfoVIProtoItemCount" Type="Int">3</Property>
            <Property Name="SourceItem[3].FolderInclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[3].Inclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[3].ItemID" Type="Ref">/My Computer/CallWithOutput.vi</Property>
            <Property Name="SourceItem[3].VIProtoInfo[0]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[0]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[0]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[0]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[0]VIProtoName" Type="Str">return value</Property>
            <Property Name="SourceItem[3].VIProtoInfo[0]VIProtoOutputIdx" Type="Int">3</Property>
            <Property Name="SourceItem[3].VIProtoInfo[0]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[1]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[1]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[1]VIProtoLenInput" Type="Int">3</Property>
            <Property Name="SourceItem[3].VIProtoInfo[1]VIProtoLenOutput" Type="Int">3</Property>
            <Property Name="SourceItem[3].VIProtoInfo[1]VIProtoName" Type="Str">MessageOut</Property>
            <Property Name="SourceItem[3].VIProtoInfo[1]VIProtoOutputIdx" Type="Int">2</Property>
            <Property Name="SourceItem[3].VIProtoInfo[1]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[2]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[2]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[2]VIProtoLenInput" Type="Int">4</Property>
            <Property Name="SourceItem[3].VIProtoInfo[2]VIProtoLenOutput" Type="Int">4</Property>
            <Property Name="SourceItem[3].VIProtoInfo[2]VIProtoName" Type="Str">ResultOut</Property>
            <Property Name="SourceItem[3].VIProtoInfo[2]VIProtoOutputIdx" Type="Int">1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[2]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[3]VIProtoDir" Type="Int">3</Property>
            <Property Name="SourceItem[3].VIProtoInfo[3]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[3]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[3]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[3]VIProtoName" Type="Str">len</Property>
            <Property Name="SourceItem[3].VIProtoInfo[3]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[3]VIProtoPassBy" Type="Int">0</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]CallingConv" Type="Int">1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]Name" Type="Str">CallWithOutput</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]VIProtoDir" Type="Int">3</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]VIProtoName" Type="Str">lenOfResult</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]VIProtoPassBy" Type="Int">0</Property>
            <Property Name="SourceItem[3].VIProtoInfoCPTM" Type="Bin">###!!A!!!!5!"!!!!"*!-0````]*5G6T&gt;7RU4X6U!"2!-0````]+476T=W&amp;H:5^V&gt;!!!$%!$"F.U982V=Q!!0!$Q!!Q!!!!"!!)!!Q!!!!!!!!!!!!!!!!!!!!!$!!"Y!!!*!!E!#1!!!!!!!!!!!!!!!!!!!!!!!!!!!1!%</Property>
            <Property Name="SourceItem[3].VIProtoInfoVIProtoItemCount" Type="Int">5</Property>
            <Property Name="SourceItem[4].FolderInclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[4].Inclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[4].ItemID" Type="Ref">/My Computer/CallWithInputAndOutput.vi</Property>
            <Property Name="SourceItem[4].VIPropertiesItemCount" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIPropertiesSettingOption[0]" Type="Str">Remove panel</Property>
            <Property Name="SourceItem[4].VIPropertiesVISetting[0]" Type="Bool">false</Property>
            <Property Name="SourceItem[4].VIProtoInfo[0]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[0]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[0]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[0]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[0]VIProtoName" Type="Str">return value</Property>
            <Property Name="SourceItem[4].VIProtoInfo[0]VIProtoOutputIdx" Type="Int">3</Property>
            <Property Name="SourceItem[4].VIProtoInfo[0]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[1]VIProtoDir" Type="Int">0</Property>
            <Property Name="SourceItem[4].VIProtoInfo[1]VIProtoInputIdx" Type="Int">11</Property>
            <Property Name="SourceItem[4].VIProtoInfo[1]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[1]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[1]VIProtoName" Type="Str">Input</Property>
            <Property Name="SourceItem[4].VIProtoInfo[1]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[1]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[2]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[2]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[2]VIProtoLenInput" Type="Int">4</Property>
            <Property Name="SourceItem[4].VIProtoInfo[2]VIProtoLenOutput" Type="Int">4</Property>
            <Property Name="SourceItem[4].VIProtoInfo[2]VIProtoName" Type="Str">MessageOut</Property>
            <Property Name="SourceItem[4].VIProtoInfo[2]VIProtoOutputIdx" Type="Int">2</Property>
            <Property Name="SourceItem[4].VIProtoInfo[2]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[3]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[3]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[3]VIProtoLenInput" Type="Int">5</Property>
            <Property Name="SourceItem[4].VIProtoInfo[3]VIProtoLenOutput" Type="Int">5</Property>
            <Property Name="SourceItem[4].VIProtoInfo[3]VIProtoName" Type="Str">ResultOut</Property>
            <Property Name="SourceItem[4].VIProtoInfo[3]VIProtoOutputIdx" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[3]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[4]VIProtoDir" Type="Int">3</Property>
            <Property Name="SourceItem[4].VIProtoInfo[4]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[4]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[4]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[4]VIProtoName" Type="Str">len</Property>
            <Property Name="SourceItem[4].VIProtoInfo[4]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[4]VIProtoPassBy" Type="Int">0</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]CallingConv" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]Name" Type="Str">CallWithInputAndOutput</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]VIProtoDir" Type="Int">3</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]VIProtoName" Type="Str">lenOfResult</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]VIProtoPassBy" Type="Int">0</Property>
            <Property Name="SourceItem[4].VIProtoInfoCPTM" Type="Bin">###!!A!!!!9!"!!!!"*!-0````]*5G6T&gt;7RU4X6U!"2!-0````]+476T=W&amp;H:5^V&gt;!!!$%!$"F.U982V=Q!!$E!Q`````Q6*&lt;H"V&gt;!!]!0!!$!!!!!%!!A!$!!!!!!!!!!!!!!!!!!!!"!)!!(A!!!E!#1!*!!!!!!!!!!!!!!!!!!!!#!!!!!!"!!5</Property>
            <Property Name="SourceItem[4].VIProtoInfoVIProtoItemCount" Type="Int">6</Property>
            <Property Name="StripLib" Type="Bool">true</Property>
            <Property Name="SupportedLanguageCount" Type="Int">0</Property>
            <Property Name="UseFFRTE" Type="Bool">false</Property>
            <Property Name="VersionInfoCompanyName" Type="Str"></Property>
            <Property Name="VersionInfoFileDescription" Type="Str"></Property>
            <Property Name="VersionInfoFileType" Type="Int">2</Property>
            <Property Name="VersionInfoFileVersionBuild" Type="Int">0</Property>
            <Property Name="VersionInfoFileVersionMajor" Type="Int">1</Property>
            <Property Name="VersionInfoFileVersionMinor" Type="Int">0</Property>
            <Property Name="VersionInfoFileVersionPatch" Type="Int">0</Property>
            <Property Name="VersionInfoInternalName" Type="Str">My DLL</Property>
            <Property Name="VersionInfoLegalCopyright" Type="Str">Copyright © 2026 </Property>
            <Property Name="VersionInfoProductName" Type="Str">My DLL</Property>
         </Item>
         <Item Name="export_lv2026" Type="DLL">
            <Property Name=".NET" Type="Bool">false</Property>
            <Property Name="Absolute[0]" Type="Bool">false</Property>
            <Property Name="Absolute[1]" Type="Bool">false</Property>
            <Property Name="Absolute[2]" Type="Bool">false</Property>
            <Property Name="AliasID" Type="Str">{220019AB-EDE3-48E8-98F6-DD03139F1F2E}</Property>
            <Property Name="AliasName" Type="Str">Project.aliases</Property>
            <Property Name="AutoIncrement" Type="Bool">false</Property>
            <Property Name="BuildName" Type="Str">export_lv2026</Property>
            <Property Name="CopyErrors" Type="Bool">false</Property>
            <Property Name="DebuggingDLL" Type="Bool">false</Property>
            <Property Name="DebugServerWaitOnLaunch" Type="Bool">true</Property>
            <Property Name="DefaultLanguage" Type="Str">English</Property>
            <Property Name="DelayOSMsg" Type="Bool">true</Property>
            <Property Name="DependencyApplyDestination" Type="Bool">true</Property>
            <Property Name="DependencyApplyInclusion" Type="Bool">true</Property>
            <Property Name="DependencyApplyProperties" Type="Bool">true</Property>
            <Property Name="DependencyFolderDestination" Type="Int">0</Property>
            <Property Name="DependencyFolderInclusion" Type="Str">As Needed</Property>
            <Property Name="DependencyFolderPropertiesItemCount" Type="Int">0</Property>
            <Property Name="DestinationID[0]" Type="Str">{AD1BE37A-615F-42E2-9B83-4377834CA928}</Property>
            <Property Name="DestinationID[1]" Type="Str">{AD1BE37A-615F-42E2-9B83-4377834CA928}</Property>
            <Property Name="DestinationID[2]" Type="Str">{557130C6-6A2C-410E-8164-0F694DFCE237}</Property>
            <Property Name="DestinationItemCount" Type="Int">3</Property>
            <Property Name="DestinationName[0]" Type="Str">example.dll</Property>
            <Property Name="DestinationName[1]" Type="Str">Destination Directory</Property>
            <Property Name="DestinationName[2]" Type="Str">Support Directory</Property>
            <Property Name="Disconnect" Type="Bool">true</Property>
            <Property Name="EmbeddedRTE" Type="Bool">false</Property>
            <Property Name="HID" Type="Str">{8055D197-D543-4B78-AA9A-0634CE61FA4D}</Property>
            <Property Name="IncludeHeaders" Type="Bool">true</Property>
            <Property Name="IncludeHWConfig" Type="Bool">false</Property>
            <Property Name="IncludeSCC" Type="Bool">true</Property>
            <Property Name="INIID" Type="Str">{A732CE04-4C9A-4651-BD3F-9B3C3F929F4E}</Property>
            <Property Name="LIBID" Type="Str">{47F8BF32-B427-4EC4-8D12-B8967F0BDBB2}</Property>
            <Property Name="ManagedClassName" Type="Str"></Property>
            <Property Name="ManagedClassNamespace" Type="Str"></Property>
            <Property Name="MathScript" Type="Bool">false</Property>
            <Property Name="Path[0]" Type="Path">../../builds/example/export_lv2026/internal.llb</Property>
            <Property Name="Path[1]" Type="Path">../../builds/example/export_lv2026</Property>
            <Property Name="Path[2]" Type="Path">../../builds/example/export_lv2026/data</Property>
            <Property Name="SharedLibraryID" Type="Str">{056752EF-6A1B-4891-999C-20CB3F392DEA}</Property>
            <Property Name="SharedLibraryName" Type="Str">example.dll</Property>
            <Property Name="ShowHWConfig" Type="Bool">false</Property>
            <Property Name="SourceInfoItemCount" Type="Int">5</Property>
            <Property Name="SourceItem[0].FolderInclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[0].Inclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[0].ItemID" Type="Ref">/My Computer/CallWithInput.vi</Property>
            <Property Name="SourceItem[0].VIProtoInfo[0]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[0]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[0]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[0]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[0]VIProtoName" Type="Str">return value</Property>
            <Property Name="SourceItem[0].VIProtoInfo[0]VIProtoOutputIdx" Type="Int">3</Property>
            <Property Name="SourceItem[0].VIProtoInfo[0]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[1]VIProtoDir" Type="Int">0</Property>
            <Property Name="SourceItem[0].VIProtoInfo[1]VIProtoInputIdx" Type="Int">11</Property>
            <Property Name="SourceItem[0].VIProtoInfo[1]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[1]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[1]VIProtoName" Type="Str">Input</Property>
            <Property Name="SourceItem[0].VIProtoInfo[1]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[1]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[2]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[2]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[2]VIProtoLenInput" Type="Int">3</Property>
            <Property Name="SourceItem[0].VIProtoInfo[2]VIProtoLenOutput" Type="Int">3</Property>
            <Property Name="SourceItem[0].VIProtoInfo[2]VIProtoName" Type="Str">MessageOut</Property>
            <Property Name="SourceItem[0].VIProtoInfo[2]VIProtoOutputIdx" Type="Int">2</Property>
            <Property Name="SourceItem[0].VIProtoInfo[2]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]CallingConv" Type="Int">1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]Name" Type="Str">CallWithInput</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]VIProtoDir" Type="Int">3</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]VIProtoName" Type="Str">len</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[0].VIProtoInfo[3]VIProtoPassBy" Type="Int">0</Property>
            <Property Name="SourceItem[0].VIProtoInfoCPTM" Type="Bin">###!!A!!!!5!"!!!!"2!-0````]+476T=W&amp;H:5^V&gt;!!!$%!$"F.U982V=Q!!$E!Q`````Q6*&lt;H"V&gt;!!]!0!!$!!!!!!!!1!#!!!!!!!!!!!!!!!!!!!!!Q-!!(A!!!!!#1!*!!!!!!!!!!!!!!!!!!!!#!!!!!!"!!1</Property>
            <Property Name="SourceItem[0].VIProtoInfoVIProtoItemCount" Type="Int">4</Property>
            <Property Name="SourceItem[1].FolderInclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[1].Inclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[1].ItemID" Type="Ref">/My Computer/HelloWorld.vi</Property>
            <Property Name="SourceItem[1].VIProtoInfo[0]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[0]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[0]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[0]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[0]VIProtoName" Type="Str">return value</Property>
            <Property Name="SourceItem[1].VIProtoInfo[0]VIProtoOutputIdx" Type="Int">3</Property>
            <Property Name="SourceItem[1].VIProtoInfo[0]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[1]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[1]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[1]VIProtoLenInput" Type="Int">2</Property>
            <Property Name="SourceItem[1].VIProtoInfo[1]VIProtoLenOutput" Type="Int">2</Property>
            <Property Name="SourceItem[1].VIProtoInfo[1]VIProtoName" Type="Str">Message</Property>
            <Property Name="SourceItem[1].VIProtoInfo[1]VIProtoOutputIdx" Type="Int">2</Property>
            <Property Name="SourceItem[1].VIProtoInfo[1]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]CallingConv" Type="Int">1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]Name" Type="Str">HelloWorld</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]VIProtoDir" Type="Int">3</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]VIProtoName" Type="Str">len</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[1].VIProtoInfo[2]VIProtoPassBy" Type="Int">0</Property>
            <Property Name="SourceItem[1].VIProtoInfoCPTM" Type="Bin">###!!A!!!!1!"!!!!""!-0````](476T=W&amp;H:1!-1!-'5X2B&gt;(6T!!!]!0!!$!!!!!!!!1!#!!!!!!!!!!!!!!!!!!!!!!-!!(A!!!!!#1!*!!!!!!!!!!!!!!!!!!!!!!!!!!!"!!-</Property>
            <Property Name="SourceItem[1].VIProtoInfoVIProtoItemCount" Type="Int">3</Property>
            <Property Name="SourceItem[2].FolderInclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[2].Inclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[2].ItemID" Type="Ref">/My Computer/Event.vi</Property>
            <Property Name="SourceItem[2].VIProtoInfo[0]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[0]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[0]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[0]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[0]VIProtoName" Type="Str">return value</Property>
            <Property Name="SourceItem[2].VIProtoInfo[0]VIProtoOutputIdx" Type="Int">3</Property>
            <Property Name="SourceItem[2].VIProtoInfo[0]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[1]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[1]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[1]VIProtoLenInput" Type="Int">2</Property>
            <Property Name="SourceItem[2].VIProtoInfo[1]VIProtoLenOutput" Type="Int">2</Property>
            <Property Name="SourceItem[2].VIProtoInfo[1]VIProtoName" Type="Str">Message</Property>
            <Property Name="SourceItem[2].VIProtoInfo[1]VIProtoOutputIdx" Type="Int">2</Property>
            <Property Name="SourceItem[2].VIProtoInfo[1]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]CallingConv" Type="Int">1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]Name" Type="Str">Event</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]VIProtoDir" Type="Int">3</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]VIProtoName" Type="Str">len</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[2].VIProtoInfo[2]VIProtoPassBy" Type="Int">0</Property>
            <Property Name="SourceItem[2].VIProtoInfoCPTM" Type="Bin">###!!A!!!!1!"!!!!""!-0````](476T=W&amp;H:1!-1!-'5X2B&gt;(6T!!!]!0!!$!!!!!!!!1!#!!!!!!!!!!!!!!!!!!!!!!-!!(A!!!!!#1!*!!!!!!!!!!!!!!!!!!!!!!!!!!!"!!-</Property>
            <Property Name="SourceItem[2].VIProtoInfoVIProtoItemCount" Type="Int">3</Property>
            <Property Name="SourceItem[3].FolderInclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[3].Inclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[3].ItemID" Type="Ref">/My Computer/CallWithOutput.vi</Property>
            <Property Name="SourceItem[3].VIProtoInfo[0]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[0]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[0]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[0]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[0]VIProtoName" Type="Str">return value</Property>
            <Property Name="SourceItem[3].VIProtoInfo[0]VIProtoOutputIdx" Type="Int">3</Property>
            <Property Name="SourceItem[3].VIProtoInfo[0]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[1]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[1]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[1]VIProtoLenInput" Type="Int">3</Property>
            <Property Name="SourceItem[3].VIProtoInfo[1]VIProtoLenOutput" Type="Int">3</Property>
            <Property Name="SourceItem[3].VIProtoInfo[1]VIProtoName" Type="Str">MessageOut</Property>
            <Property Name="SourceItem[3].VIProtoInfo[1]VIProtoOutputIdx" Type="Int">2</Property>
            <Property Name="SourceItem[3].VIProtoInfo[1]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[2]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[2]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[2]VIProtoLenInput" Type="Int">4</Property>
            <Property Name="SourceItem[3].VIProtoInfo[2]VIProtoLenOutput" Type="Int">4</Property>
            <Property Name="SourceItem[3].VIProtoInfo[2]VIProtoName" Type="Str">ResultOut</Property>
            <Property Name="SourceItem[3].VIProtoInfo[2]VIProtoOutputIdx" Type="Int">1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[2]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[3]VIProtoDir" Type="Int">3</Property>
            <Property Name="SourceItem[3].VIProtoInfo[3]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[3]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[3]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[3]VIProtoName" Type="Str">len</Property>
            <Property Name="SourceItem[3].VIProtoInfo[3]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[3]VIProtoPassBy" Type="Int">0</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]CallingConv" Type="Int">1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]Name" Type="Str">CallWithOutput</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]VIProtoDir" Type="Int">3</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]VIProtoName" Type="Str">lenOfResult</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[3].VIProtoInfo[4]VIProtoPassBy" Type="Int">0</Property>
            <Property Name="SourceItem[3].VIProtoInfoCPTM" Type="Bin">###!!A!!!!5!"!!!!"*!-0````]*5G6T&gt;7RU4X6U!"2!-0````]+476T=W&amp;H:5^V&gt;!!!$%!$"F.U982V=Q!!0!$Q!!Q!!!!"!!)!!Q!!!!!!!!!!!!!!!!!!!!!$!!"Y!!!*!!E!#1!!!!!!!!!!!!!!!!!!!!!!!!!!!1!%</Property>
            <Property Name="SourceItem[3].VIProtoInfoVIProtoItemCount" Type="Int">5</Property>
            <Property Name="SourceItem[4].FolderInclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[4].Inclusion" Type="Str">Exported VI</Property>
            <Property Name="SourceItem[4].ItemID" Type="Ref">/My Computer/CallWithInputAndOutput.vi</Property>
            <Property Name="SourceItem[4].VIPropertiesItemCount" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIPropertiesSettingOption[0]" Type="Str">Remove panel</Property>
            <Property Name="SourceItem[4].VIPropertiesVISetting[0]" Type="Bool">false</Property>
            <Property Name="SourceItem[4].VIProtoInfo[0]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[0]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[0]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[0]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[0]VIProtoName" Type="Str">return value</Property>
            <Property Name="SourceItem[4].VIProtoInfo[0]VIProtoOutputIdx" Type="Int">3</Property>
            <Property Name="SourceItem[4].VIProtoInfo[0]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[1]VIProtoDir" Type="Int">0</Property>
            <Property Name="SourceItem[4].VIProtoInfo[1]VIProtoInputIdx" Type="Int">11</Property>
            <Property Name="SourceItem[4].VIProtoInfo[1]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[1]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[1]VIProtoName" Type="Str">Input</Property>
            <Property Name="SourceItem[4].VIProtoInfo[1]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[1]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[2]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[2]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[2]VIProtoLenInput" Type="Int">4</Property>
            <Property Name="SourceItem[4].VIProtoInfo[2]VIProtoLenOutput" Type="Int">4</Property>
            <Property Name="SourceItem[4].VIProtoInfo[2]VIProtoName" Type="Str">MessageOut</Property>
            <Property Name="SourceItem[4].VIProtoInfo[2]VIProtoOutputIdx" Type="Int">2</Property>
            <Property Name="SourceItem[4].VIProtoInfo[2]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[3]VIProtoDir" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[3]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[3]VIProtoLenInput" Type="Int">5</Property>
            <Property Name="SourceItem[4].VIProtoInfo[3]VIProtoLenOutput" Type="Int">5</Property>
            <Property Name="SourceItem[4].VIProtoInfo[3]VIProtoName" Type="Str">ResultOut</Property>
            <Property Name="SourceItem[4].VIProtoInfo[3]VIProtoOutputIdx" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[3]VIProtoPassBy" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[4]VIProtoDir" Type="Int">3</Property>
            <Property Name="SourceItem[4].VIProtoInfo[4]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[4]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[4]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[4]VIProtoName" Type="Str">len</Property>
            <Property Name="SourceItem[4].VIProtoInfo[4]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[4]VIProtoPassBy" Type="Int">0</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]CallingConv" Type="Int">1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]Name" Type="Str">CallWithInputAndOutput</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]VIProtoDir" Type="Int">3</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]VIProtoInputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]VIProtoLenInput" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]VIProtoLenOutput" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]VIProtoName" Type="Str">lenOfResult</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]VIProtoOutputIdx" Type="Int">-1</Property>
            <Property Name="SourceItem[4].VIProtoInfo[5]VIProtoPassBy" Type="Int">0</Property>
            <Property Name="SourceItem[4].VIProtoInfoCPTM" Type="Bin">###!!A!!!!9!"!!!!"*!-0````]*5G6T&gt;7RU4X6U!"2!-0````]+476T=W&amp;H:5^V&gt;!!!$%!$"F.U982V=Q!!$E!Q`````Q6*&lt;H"V&gt;!!]!0!!$!!!!!%!!A!$!!!!!!!!!!!!!!!!!!!!"!)!!(A!!!E!#1!*!!!!!!!!!!!!!!!!!!!!#!!!!!!"!!5</Property>
            <Property Name="SourceItem[4].VIProtoInfoVIProtoItemCount" Type="Int">6</Property>
            <Property Name="StripLib" Type="Bool">true</Property>
            <Property Name="SupportedLanguageCount" Type="Int">0</Property>
            <Property Name="UseFFRTE" Type="Bool">false</Property>
            <Property Name="VersionInfoCompanyName" Type="Str"></Property>
            <Property Name="VersionInfoFileDescription" Type="Str"></Property>
            <Property Name="VersionInfoFileType" Type="Int">2</Property>
            <Property Name="VersionInfoFileVersionBuild" Type="Int">0</Property>
            <Property Name="VersionInfoFileVersionMajor" Type="Int">1</Property>
            <Property Name="VersionInfoFileVersionMinor" Type="Int">0</Property>
            <Property Name="VersionInfoFileVersionPatch" Type="Int">0</Property>
            <Property Name="VersionInfoInternalName" Type="Str">My DLL</Property>
            <Property Name="VersionInfoLegalCopyright" Type="Str">Copyright © 2026 </Property>
            <Property Name="VersionInfoProductName" Type="Str">My DLL</Property>
         </Item>
      </Item>
   </Item>
</Project>
