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

NULLNAME MenuTrig
{
	{
		"\8DTrig"
		::
			TakeOver
			HandleMenuItem
			xTRIG
		;
	}
	
	NullMenuKey
	NullMenuKey
	NullMenuKey
	
	{
		::
			TakeOver
			"Hyp"
			MakeDirLabel
		;
		::
			TakeOver
			mTrigHyp
			DoCustomMenu1
		;
	}
	
	{
		::
			TakeOver
			"Trans"
			MakeDirLabel
		;
		::
			TakeOver
			mTrigTransform
			DoCustomMenu1
		;
	}
}


NULLNAME MenuTrigHyp
{
	{
		"SINH"
		::
			TakeOver
			HandleMenuItem
			xSINH
		;
	}
	
	{
		"COSH"
		::
			TakeOver
			HandleMenuItem
			xCOSH
		;
	}
	
	{
		"TANH"
		::
			TakeOver
			HandleMenuItem
			xTANH
		;
	}
	
	{
		"ASINH"
		::
			TakeOver
			HandleMenuItem
			xASINH
		;
	}
	
	{
		"ACOSH"
		::
			TakeOver
			HandleMenuItem
			xACOSH
		;
	}
	
	{
		"ATANH"
		::
			TakeOver
			HandleMenuItem
			xATANH
		;
	}
	
	{
		::
			TakeOver
			"CSCH"	
			MakeSpecialLabel
		;
		::
			TakeOver
			HandleMenuItem_NoHelp
			xCSCH
		;
	}
	
	{
		::
			TakeOver
			"SECH"	
			MakeSpecialLabel
		;
		::
			TakeOver
			HandleMenuItem_NoHelp
			xSECH
		;
	}
	
	{
		::
			TakeOver
			"COTH"	
			MakeSpecialLabel
		;
		::
			TakeOver
			HandleMenuItem_NoHelp
			xCOTH
		;
	}
	
	{
		::
			TakeOver
			"ACSCH"	
			MakeSpecialLabel
		;
		::
			TakeOver
			HandleMenuItem_NoHelp
			xACSCH
		;
	}
	
	{
		::
			TakeOver
			"ASECH"	
			MakeSpecialLabel
		;
		::
			TakeOver
			HandleMenuItem_NoHelp
			xASECH
		;
	}
	
	{
		::
			TakeOver
			"ACOTH"	
			MakeSpecialLabel
		;
		::
			TakeOver
			HandleMenuItem_NoHelp
			xACOTH
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
			mTrig
			DoCustomMenu1
		;
	}
}


NULLNAME MenuTrigTransform
{
	{
		"\8DSin"
		::
			TakeOver
			HandleMenuItem
			xTRIGSIN
		;
	}
	
	{
		"\8DCos"
		::
			TakeOver
			HandleMenuItem
			xTRIGCOS
		;
	}
	
	{
		"\8DTan"
		::
			TakeOver
			HandleMenuItem
			xTRIGTAN
		;
	}
	
	{
		"\8DTanHalf"
		::
			TakeOver
			HandleMenuItem
			xHALFTAN
		;
	}
	
	{
		"Tan\8DSC"
		::
			TakeOver
			HandleMenuItem
			xTAN2SC
		;
	}
	
	{
		"Tan\8DSC2"
		::
			TakeOver
			HandleMenuItem
			xTAN2SC2
		;
	}
	
	{
		"Tan\8DS2"
		::
			TakeOver
			HandleMenuItem
			xTAN2CS2
		;
	}
	
	{
		GROB_UpArrow
		::
			TakeOver
			mTrig
			DoCustomMenu1
		;
	}
}
