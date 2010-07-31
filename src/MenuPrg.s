( CodaHP: HP49/50 User Interface Improvements												 )
( Copyright 2008-2010 Ryan Edwards																	 )
(                                                                    )
( This program is free software; you can redistribute it and/or      )
( modify it under the terms of the GNU General Public License        )
( as published by the Free Software Foundation; either version 2     )
( of the License, or, at your option, any later version.             )
(																																		 )
( This program is distributed in the hope that it will be useful,    )
( but WITHOUT ANY WARRANTY; without even the implied warranty of     )
( MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the      )
( GNU General Public License for more details.                       )
( 																																	 )
( You should have received a copy of the GNU General Public License  )
( along with this program; if not, write to the Free Software        )
( Foundation, Inc., 51 Franklin Street, Fifth Floor,                 )
( Boston, MA  02110-1301, USA.																			 )

RPL

INCLUDE CODA.h
INCLUDE	Definitions.h

(	------------------------------------------------------- )
(	Programming
(	------------------------------------------------------- )
NULLNAME MenuPrg
{
	{
		::
			TakeOver
			"Stack"
			MakeDirLabel
		;
		::
			TakeOver
			mPrgStack
			DoCustomMenu1
		;
	}
	
	{
		::
			TakeOver
			"Mem"
			MakeDirLabel
		;
		::
			TakeOver
			mPrgMem
			DoCustomMenu1
		;
	}
	
	{
		::
			TakeOver
			"Brch"
			MakeDirLabel
		;
		::
		;
	}
	
	{
		::
			TakeOver
			"Test"
			MakeDirLabel
		;
		::
		;
	}
	
	{
		::
			TakeOver
			"Type"
			MakeDirLabel
		;
		::
			
		;
	}
	
	{
		::
			TakeOver
			"Error"
			MakeDirLabel
		;
		::
			
		;
	}
	
	{
		::
			TakeOver
			"In"
			MakeDirLabel
		;
		::
			
		;
	}
	
	{
		::
			TakeOver
			"Out"
			MakeDirLabel
		;
		::
			
		;
	}
	
	{
		::
			TakeOver
			"Str"
			MakeDirLabel
		;
		::
			
		;
	}
	
	{
		::
			TakeOver
			"Grob"
			MakeDirLabel
		;
		::
			
		;
	}
	
	{
		::
			TakeOver
			"Plot"
			MakeDirLabel
		;
		::
			
		;
	}
	
	{
		::
			TakeOver
			"IO"
			MakeDirLabel
		;
		::
			
		;
	}
	
	{
		::
			TakeOver
			"Run"
			MakeDirLabel
		;
		::
			
		;
	}
	
	{
		::
			TakeOver
			"Dev"
			MakeDirLabel
		;
		::
			TakeOver
			mPrgDev
			DoCustomMenu1
		;
	}
}


(	------------------------------------------------------- )
(	Programming > Stack
(	------------------------------------------------------- )
NULLNAME MenuPrgStack
{
	{
		::
			TakeOver
			"Dup"
			MakeDirLabel
		;
		::
			TakeOver
			mPrgStackDup
			DoCustomMenu1
		;
	}
	
	{
		::
			TakeOver
			"Drop"
			MakeDirLabel
		;
		::
			TakeOver
			mPrgStackDrop
			DoCustomMenu1
		;
	}
	
	{
		::
			TakeOver
			"Pick"
			MakeDirLabel
		;
		::
			TakeOver
			mPrgStackPick
			DoCustomMenu1
		;
	}
	
	{
		::
			TakeOver
			"Roll"
			MakeDirLabel
		;
		::
			TakeOver
			mPrgStackRoll
			DoCustomMenu1
		;
	}
	
	{
		"Depth"
		::
			TakeOver
			HandleMenuItem
			xDEPTH
		;
	}
	
	{
		GROB_UpArrow
		::
			TakeOver
			mPrg
			DoCustomMenu1
		;
	}
}


(	------------------------------------------------------- )
(	Programming > Stack > Dup
(	------------------------------------------------------- )
NULLNAME MenuPrgStackDup
{
	{
		"Dup"
		::
			TakeOver
			HandleMenuItem
			xDUP
		;
	}
	
	{
		"Dup2"
		::
			TakeOver
			HandleMenuItem
			xDUP2
		;
	}
	
	{
		"DupN"
		::
			TakeOver
			HandleMenuItem
			xDUPN
		;
	}
	
	{
		"DupDup"
		::
			TakeOver
			HandleMenuItem
			xDUPDUP
		;
	}
	
	{
		"NDupN"
		::
			TakeOver
			HandleMenuItem
			xNDUPN
		;
	}
	
	{
		GROB_UpArrow
		::
			TakeOver
			mPrgStack
			DoCustomMenu1
		;
	}
}


(	------------------------------------------------------- )
(	Programming > Stack > Drop
(	------------------------------------------------------- )
NULLNAME MenuPrgStackDrop
{
	{
		"Drop"
		::
			TakeOver
			HandleMenuItem
			xDROP
		;
	}
	
	{
		"NIP"
		::
			TakeOver
			HandleMenuItem
			xNIP
		;
	}
	
	{
		"Drop2"
		::
			TakeOver
			HandleMenuItem
			xDROP2
		;
	}
	
	{
		"DropN"
		::
			TakeOver
			HandleMenuItem
			xDROPN
		;
	}
	
	{
		"Clear"
		::
			TakeOver
			HandleMenuItem
			xCLEAR
		;
	}
	
	{
		GROB_UpArrow
		::
			TakeOver
			mPrgStack
			DoCustomMenu1
		;
	}
}


(	------------------------------------------------------- )
(	Programming > Stack > Pick
(	------------------------------------------------------- )
NULLNAME MenuPrgStackPick
{
	{
		"Pick"
		::
			TakeOver
			HandleMenuItem
			xPICK
		;
	}
	
	{
		"Over"
		::
			TakeOver
			HandleMenuItem
			xOVER
		;
	}
	
	{
		"Pick3"
		::
			TakeOver
			HandleMenuItem
			xPICK3
		;
	}
	
	{
		"Unpck"
		::
			TakeOver
			HandleMenuItem
			xUNPICK
		;
	}
	
	NullMenuKey
	
	{
		GROB_UpArrow
		::
			TakeOver
			mPrgStack
			DoCustomMenu1
		;
	}
}


(	------------------------------------------------------- )
(	Programming > Stack > Roll
(	------------------------------------------------------- )
NULLNAME MenuPrgStackRoll
{
	{
		"Roll\8F"
		::
			TakeOver
			HandleMenuItem
			xROLL
		;
	}
	
	{
		"Roll\90"
		::
			TakeOver
			HandleMenuItem
			xROLLD
		;
	}
	
	{
		"Swap"
		::
			TakeOver
			HandleMenuItem
			xSWAP
		;
	}
	
	{
		"Rot"
		::
			TakeOver
			HandleMenuItem
			xROT
		;
	}
	
	{
		"Unrot"
		::
			TakeOver
			HandleMenuItem
			xUNROT
		;
	}
	
	{
		GROB_UpArrow
		::
			TakeOver
			mPrgStack
			DoCustomMenu1
		;
	}
}


(	------------------------------------------------------- )
(	Programming > Memory
(	------------------------------------------------------- )
NULLNAME MenuPrgMem
{
	( SUBMENU: Objects )
	{
		::
			TakeOver
			"Obj"
			MakeDirLabel
		;
		::
			TakeOver
			mPrgMemObj
			DoCustomMenu1
		;
	}
	
	( SUBMENU: Directories )
	{
		::
			TakeOver
			"Dir"
			MakeDirLabel
		;
		::
			TakeOver
			mPrgMemDir
			DoCustomMenu1
		;
	}
	
	( SUBMENU: Ports )
	{
		::
			TakeOver
			"Port"
			MakeDirLabel
		;
		::
			TakeOver
			mPrgMemPort
			DoCustomMenu1
		;
	}
	
	( SUBMENU: Math )
	{
		::
			TakeOver
			"Math"
			MakeDirLabel
		;
		::
			TakeOver
			mPrgMemMath
			DoCustomMenu1
		;
	}
	
	( MEM )
	{
		"Mem"
		::
			TakeOver
			HandleMenuItem
			xMEM
		;
	}
	
	( BYTES )
	{
		"Bytes"
		::
			TakeOver
			HandleMenuItem
			xBYTES
		;
	}
	
	( ARCHIVE )
	{
		"Archv"
		::
			TakeOver
			HandleMenuItem
			xARCHIVE
		;
	}
	
	( RESTORE )
	{
		"Restore"
		::
			TakeOver
			HandleMenuItem
			xRESTORE
		;
	}
	
	NullMenuKey
	NullMenuKey
	NullMenuKey
	
	( MENU BACK: Return to the Programming Menu )
	{
		GROB_UpArrow
		::
			TakeOver
			mPrg
			DoCustomMenu1
		;
	}
}


(	------------------------------------------------------- )
(	Programming > Memory > Objects
(	------------------------------------------------------- )
NULLNAME MenuPrgMemObj
{
  ( STO )
	{
		"Sto"
		::
			TakeOver
			HandleMenuItem
			xSTO
		;
	}
	
	( RCL )
	{
		"Rcl"
		::
			TakeOver
			HandleMenuItem
			xRCL
		;
	}
	
	( PURGE )
	{
		"Purge"
		::
			TakeOver
			HandleMenuItem
			xPURGE
		;
	}
	
	( RENAME )
	{
		"Rename"
		::
			TakeOver
			HandleMenuItem
			xRENAME
		;
	}
	
	NullMenuKey
	
	( MENU BACK: Return to the Memory Menu )
	{
		GROB_UpArrow
		::
			TakeOver
			mPrgMem
			DoCustomMenu1
		;
	}
}


(	------------------------------------------------------- )
(	Programming > Development
(	------------------------------------------------------- )
NULLNAME MenuPrgDev
{
	xASM2
	x>S2	
	
	{
		::
			TakeOver
			"256"
			MakeDirLabel
		;
		::
			TakeOver
			% 256
			InitMenu%
		;
	}
	
	NullMenuKey
	NullMenuKey
	
	{
		GROB_UpArrow
		::
			TakeOver
			mPrg
			mPage3
			DoCustomMenu2
		;
	}
}
