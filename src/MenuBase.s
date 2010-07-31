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


NULLNAME MenuBase
{
	{
		::
			TakeOver
			"Bin"
			BINT2
			MenuBase_DoTickMark
		;
		::
			TakeOver
			HandleMenuItem
			xBIN
		;
	}
	
	{
		::
			TakeOver
			"Oct"
			BINT8
			MenuBase_DoTickMark
		;
		::
			TakeOver
			HandleMenuItem
			xOCT
		;
	}
	
	{
		::
			TakeOver
			"Dec"
			BINT10
			MenuBase_DoTickMark
		;
		::
			TakeOver
			HandleMenuItem
			xDEC
		;
	}
	
	{
		::
			TakeOver
			"Hex"
			BINT16
			MenuBase_DoTickMark
		;
		::
			TakeOver
			HandleMenuItem
			xHEX
		;
	}
	
	{
		"R\8DB"
		::
			TakeOver
			HandleMenuItem_CustomHelp
			xR>B
			"R>B"
		;
	}
	
	{
		"B\8DR"
		::
			TakeOver
			HandleMenuItem_CustomHelp
			xB>R
			"B>R"
		;
	}
	
	{
		::
			TakeOver
			"Logic"
			MakeDirLabel
		;
		::
			TakeOver
			mBaseLogic
			DoCustomMenu1
		;
	}	
	
	{
		::
			TakeOver
			"Bit"
			MakeDirLabel
		;
		::
			TakeOver
			mBaseBit
			DoCustomMenu1
		;
	}	
	
	{
		::
			TakeOver
			"Byte"
			MakeDirLabel
		;
		::
			TakeOver
			mBaseByte
			DoCustomMenu1
		;
	}
	
	NullMenuKey
	
	{
		"STWS"
		::
			TakeOver
			HandleMenuItem
			xSTWS
		;
	}
	
	{
		"RCWS"
		::
			TakeOver
			HandleMenuItem
			xRCWS
		;
	}
}


NULLNAME MenuBaseLogic
{
	{
		"And"
		::
			TakeOver
			HandleMenuItem
			xAND
		;
	}
	
	{
		"Or"
		::
			TakeOver
			HandleMenuItem
			xOR
		;
	}
	
	{
		"Xor"
		::
			TakeOver
			HandleMenuItem
			xXOR
		;
	}
	
	{
		"Not"
		::
			TakeOver
			HandleMenuItem
			xNOT
		;
	}
	
	NullMenuKey
	
	{
		GROB_UpArrow
		::
			TakeOver
			mBase
			mPage2
			DoCustomMenu2
		;
	}
}


NULLNAME MenuBaseBit
{
	{
		"RL"
		::
			TakeOver
			HandleMenuItem
			xRL
		;
	}
	
	{
		"SL"
		::
			TakeOver
			HandleMenuItem
			xSL
		;
	}
	
	{
		"ASR"
		::
			TakeOver
			HandleMenuItem
			xASR
		;
	}
	
	{
		"SR"
		::
			TakeOver
			HandleMenuItem
			xSR
		;
	}
	
	{
		"RR"
		::
			TakeOver
			HandleMenuItem
			xRR
		;
	}
	
	{
		GROB_UpArrow
		::
			TakeOver
			mBase
			mPage2
			DoCustomMenu2
		;
	}
}


NULLNAME MenuBaseByte
{
	{
		"RLB"
		::
			TakeOver
			HandleMenuItem
			xRLB
		;
	}
	
	{
		"SLB"
		::
			TakeOver
			HandleMenuItem
			xSLB
		;
	}
	
	NullMenuKey
	
	{
		"SRB"
		::
			TakeOver
			HandleMenuItem
			xSRB
		;
	}
	
	{
		"RRB"
		::
			TakeOver
			HandleMenuItem
			xRRB
		;
	}
	
	{
		GROB_UpArrow
		::
			TakeOver
			mBase
			mPage2
			DoCustomMenu2
		;
	}
}


NULLNAME MenuBase_DoTickMark
::
	BASE
	EQ
	Box/StdLabel
;
