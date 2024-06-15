# Microsoft Developer Studio Project File - Name="WJ202108060918" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=WJ202108060918 - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "WJ202108060918.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "WJ202108060918.mak" CFG="WJ202108060918 - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "WJ202108060918 - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "WJ202108060918 - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "WJ202108060918 - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_MBCS" /D "_LIB" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_MBCS" /D "_LIB" /YX /FD /c
# ADD BASE RSC /l 0x804 /d "NDEBUG"
# ADD RSC /l 0x804 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "WJ202108060918 - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_MBCS" /D "_LIB" /YX /FD /GZ  /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_MBCS" /D "_LIB" /YX /FD /GZ  /c
# ADD BASE RSC /l 0x804 /d "_DEBUG"
# ADD RSC /l 0x804 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ENDIF 

# Begin Target

# Name "WJ202108060918 - Win32 Release"
# Name "WJ202108060918 - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\address.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\asn1.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\auth_priv.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\counter.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\ctr64.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\eventlist.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\eventlistholder.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\gauge.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\idea.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\integer.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\IPv6Utility.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\log.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\md5c.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\mp_v3.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\msec.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\msgqueue.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\notifyqueue.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\octet.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\oid.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\pdu.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\reentrant.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\sha.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\snmpmsg.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\target.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\timetick.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\usm_v3.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\uxsnmp.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\v3.cpp"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\SNMP++\src\vb.cpp"
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\address.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\asn1.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\auth_priv.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\collect.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\config_snmp_pp.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\counter.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\ctr64.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\eventlist.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\eventlistholder.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\gauge.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\idea.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\integer.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\IPv6Utility.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\log.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\md5.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\mp_v3.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\msec.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\msgqueue.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\notifyqueue.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\octet.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\oid.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\oid_def.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\pdu.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\reentrant.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\sha.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\smi.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\smival.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\snmp_pp.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\snmperrs.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\snmpmsg.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\target.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\timetick.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\usm_v3.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\uxsnmp.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\v3.h"
# End Source File
# Begin Source File

SOURCE="..\..\..\..\..\..\..\VC++\Microsoft Visual Studio\VC98\Include\snmp_pp\vb.h"
# End Source File
# End Group
# End Target
# End Project
