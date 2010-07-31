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


NULLNAME MenuArith
{
	{
		"Mod"
		::
			TakeOver
			HandleMenuItem
			xMOD
		;
	}
	
	{
		"Abs"
		::
			TakeOver
			HandleMenuItem
			xABS
		;
	}
	
	{
		"D\8DR" ( D->R )
		::
			TakeOver
			HandleMenuItem_CustomHelp
			xD>R
			"D>R"
		;
	}
	
	{
		"R\8DD" ( R->D )
		::
			TakeOver
			HandleMenuItem_CustomHelp
			xR>D
			"R>D"
		;
	}
	
	{
		"PF\7EIF" ( PF~IF )
		::
			TakeOver
			HandleMenuItem
			xPROPFRAC
		;
	}
	
	{
		"\8DXQ" ( ->XQ )
		::
			TakeOver
			HandleMenuItem
			xXQ
		;
	}
	
	{
		"\25" ( % )
		::
			TakeOver
			HandleMenuItem
			x%
		;
	}
	
	{
		"\25CH" ( %CH )
		::
			TakeOver
			HandleMenuItem
			x%CH
		;
	}
	
	{
		::
			TakeOver
			"\25D" ( %D )	
			MakeSpecialLabel
		;
		::
			TakeOver
			HandleMenuItem_NoHelp
			x\25D
		;
	}
	
	{
		"\25T" ( %T )
		::
			TakeOver
			HandleMenuItem
			x%T
		;
	}
	
	{
		"GCD"
		::
			TakeOver
			HandleMenuItem
			xGCD
		;
	}
	
	{
		"LCM"
		::
			TakeOver
			HandleMenuItem
			xLCM
		;
	}
	
	{
		"Rnd"
		::
			TakeOver
			HandleMenuItem
			xRND
		;
	}
	
	{
		::
			TakeOver
			"Rnd\90" ( Round Up )
			MakeSpecialLabel
		;
		::
			TakeOver
			HandleMenuItem_NoHelp
			xRND\90
		;
	}
	
	{
		::
			TakeOver
			"Rnd\8F" ( Round Down )
			MakeSpecialLabel
		;
		::
			TakeOver
			HandleMenuItem_NoHelp
			xRND\8F
		;
	}
	
	{
		::
			TakeOver
			"Rnd\90\8F" ( Round to Nearest )
			MakeSpecialLabel
		;
		::
			TakeOver
			HandleMenuItem_NoHelp
			xRND\90\8F
		;
	}	
	
	{
		"Floor"
		::
			TakeOver
			HandleMenuItem
			xFLOOR
		;
	}
	
	{
		"Ceil"
		::
			TakeOver
			HandleMenuItem
			xCEIL
		;
	}
	
	{
		"Trunc"
		::
			TakeOver
			HandleMenuItem
			xTRNC
		;
	}
	
	{
		"Max"
		::
			TakeOver
			HandleMenuItem
			xMAX
		;
	}
	
	{
		"Min"
		::
			TakeOver
			HandleMenuItem
			xMIN
		;
	}
}
