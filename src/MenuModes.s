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


NULLNAME MenuMode
{
	{
		::
			TakeOver
			"Fmt"
			MakeDirLabel
		;
		::
			TakeOver
			mModeFormat
			DoCustomMenu1
		;
	}
	
	{
		::
			TakeOver
			"Angle"
			MakeDirLabel
		;
		::
			TakeOver
			mModeAngle
			DoCustomMenu1
		;
	}
	
	{
		::
			TakeOver
			"Coord"
			MakeDirLabel
		;
		::
			TakeOver
			mModeCoord
			DoCustomMenu1
		;
	}
	
	{
		::
			TakeOver
			"CAS"
			MakeDirLabel
		;
		::
			TakeOver
			mModeCAS
			DoCustomMenu1
		;
	}
	
	{
		::
			TakeOver
			"Menus"
			MakeDirLabel
		;
		::
			TakeOver
			mModeMenu
			DoCustomMenu1
		;
	}
	
	{
		::
			TakeOver
			"Keys"
			MakeDirLabel
		;
		::
			TakeOver
			mModeKey
			DoCustomMenu1
		;
	}
	
	{
		::
			TakeOver
			"Flags"
			MakeDirLabel
		;
		::
			TakeOver
			mModeFlag
			DoCustomMenu1
		;
	}
	
	{
		::
			TakeOver
			"Fonts"
			MakeDirLabel
		;
		::
			TakeOver
			mModeFont
			DoCustomMenu1
		;
	}
	
	{
		::
			TakeOver
			"Disp"
			MakeDirLabel
		;
		::
			TakeOver
			mModeDisplay
			DoCustomMenu1
		;
	}
	
	NullMenuKey
	NullMenuKey
	NullMenuKey
	
	{
		"CVers"
		::
			TakeOver
			constCodaVersion
		;
	}
	
	{
		"Vers"
		::
			TakeOver
			HandleMenuItem
			xVERSION
		;
	}
		
	{
		"WSLog"
		::
			TakeOver
			HandleMenuItem
			xWSLOG
		;
	}
	
	{
		"S/N"
		::
			TakeOver
			HandleMenuItem
			xSERIAL
		;
	}
	
	NullMenuKey
	
	{
		::
			TakeOver
			"Mode"
			MakeDirLabel
		;
		::
			TakeOver
			% -22.21
  		xKEYEVAL
  		SysDisplay
		;
	}
}


NULLNAME MenuModeFormat
{
	{
		::
			TakeOver
			"Std"
			BINT49
			TestSysFlag
			NOTcase
			::
				BINT50
				TestSysFlag
				NOTcase
					MakeBoxLabel
			;
		;
		::
			TakeOver
			HandleMenuItem
			xSTD
		;
	}
	
	{
		::
			TakeOver
			"Fix"
			BINT49
			TestSysFlag
			case
			::
				BINT50
				TestSysFlag
				NOTcase
					MakeBoxLabel
			;
		;
		::
			TakeOver
			HandleMenuItem
			xFIX
		;
	}
	
	{
		::
			TakeOver
			"Sci"
			BINT49
			TestSysFlag
			NOTcase
			::
				BINT50
				TestSysFlag
				case
					MakeBoxLabel
			;
		;
		::
			TakeOver
			HandleMenuItem
			xSCI
		;
	}
	
	{
		::
			TakeOver
			"Eng"
			BINT49
			TestSysFlag
			case
			::
				BINT50
				TestSysFlag
				case
					MakeBoxLabel
			;
		;
		::
			TakeOver
			HandleMenuItem
			xENG
		;
	}
	
	NullMenuKey
	
	{
		GROB_UpArrow
		::
			TakeOver
			mMode
			DoCustomMenu1
		;
	}
}


NULLNAME MenuModeAngle
{
  {
		::
			TakeOver
			"Deg"
			RAD?
			BINT18
			TestSysFlag
			ORNOT
			Box/StdLabel
		;
		::
			TakeOver
			HandleMenuItem
			xDEG
		;
	}
	
	{
		::
			TakeOver
			"Rad"
			RAD?
			Box/StdLabel
		;
		::
			TakeOver
			HandleMenuItem
			xRAD
		;
	}
	
	{
		::
			TakeOver
			"Grad"
			RAD?
			BINT18
			TestSysFlag
			NOT
			ORNOT
			Box/StdLabel
		;
		::
			TakeOver
			HandleMenuItem
			xGRAD
		;
	}
	
	NullMenuKey
	NullMenuKey
	
	{
		GROB_UpArrow
		::
			TakeOver
			mMode
			DoCustomMenu1
		;
	}
}


NULLNAME MenuModeCoord
{
  {
		::
			TakeOver
			"Rect"
			BINT16
			TestSysFlag
			NOT
			Box/StdLabel
		;
		::
			TakeOver
			HandleMenuItem
			xRECT
		;
	}
	
	{
		::
			TakeOver
			"Cylindrical"
			BINT15
			TestSysFlag
			NOT
			BINT16
			TestSysFlag
			AND
			Box/StdLabel
		;
		::
			TakeOver
			HandleMenuItem
			xCYLIN
		;
	}
	
	{
		::
			TakeOver
			"Spherical"
			BINT15
			TestSysFlag
			BINT16
			TestSysFlag
			AND
			Box/StdLabel
		;
		::
			TakeOver
			HandleMenuItem
			xSPHERE
		;
	}
	
	NullMenuKey
	NullMenuKey
	
	{
		GROB_UpArrow
		::
			TakeOver
			mMode
			DoCustomMenu1
		;
	}
}


NULLNAME MenuModeCAS
{
  {
		"VX\8D"
		::
			TakeOver
			HandleMenuItem
			xRCLVX
		;
	}
	
	{
		"\8DVX"
		::
			TakeOver
			HandleMenuItem
			xSTOVX
		;
	}
	
	{
		"\8DMod"
		::
			TakeOver
			HandleMenuItem
			xMODSTO
		;
	}
	
	( NEED TO ADD A CHECK HERE!!! )
	{
		"Reset"
		::
			TakeOver
			HandleMenuItem
			xCASCFG
		;
	}
	
	{
		"Help"
		::
			TakeOver
			HandleMenuItem
			xCASCMD
		;
	}
	
	{
		"Vers"
		::
			TakeOver
			HandleMenuItem
			xVER
		;
	}
	
	NullMenuKey
	NullMenuKey
	NullMenuKey
	NullMenuKey
	NullMenuKey
	
	{
		GROB_UpArrow
		::
			TakeOver
			mMode
			DoCustomMenu1
		;
	}
}


NULLNAME MenuModeMenu
{
  {
		"Menu2"
		::
			TakeOver
			HandleMenuItem_NoHelp
			xMENU2
		;
	}
	
	{
		"Menu"
		::
			TakeOver
			HandleMenuItem
			xMENU
		;
	}
	
	{
		"TMenu"
		::
			TakeOver
			HandleMenuItem
			xTMENU
		;
	}
	
	{
		"RclMenu"
		::
			TakeOver
			HandleMenuItem
			xRCLMENU
		;
	}
	
	ID CST
	
	{
		GROB_UpArrow
		::
			TakeOver
			mMode
			DoCustomMenu1
		;
	}
}


NULLNAME MenuModeRPLMNU
{
	( Toggle Vectored Enter )
	{
		::
			TakeOver
			"Vectr"
			flagVectoredEnter
			TestSysFlag
			IT
				MakeBoxLabel
		;
		::
			TakeOver
			flagVectoredEnter
			DUP
			SysITE
				ClrSysFlag
				SetSysFlag
		;
	}
		
	NullMenuKey
	NullMenuKey
	NullMenuKey
	NullMenuKey
		
	{
		GROB_UpArrow
		::
			TakeOver
			mMode
			BINT2
			DoCustomMenu2
		;
	}
}
