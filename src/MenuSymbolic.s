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

NULLNAME MenuSymbolic
{
	{
		"Simp"
		::
			TakeOver
			HandleMenuItem
			xSIMPLIFY
		;
	}	
	
	{
		"Fact"
		::
			TakeOver
			HandleMenuItem
			xFACTOR
		;
	}
	
	{
		"Expnd"
		::
			TakeOver
			HandleMenuItem
			xEXPAND
		;
	}
	
	{
		"Dist"
		::
			TakeOver
			HandleMenuItem_NoHelp
			xFDISTRIB
		;
	}
	
	{
		"1Dist"
		::
			TakeOver
			HandleMenuItem_NoHelp
			xDISTRIB
		;
	}
	
	{
		"Subst"
		::
			TakeOver
			HandleMenuItem
			xSUBST
		;
	}
	
	{
		"PowEx"
		::
			TakeOver
			HandleMenuItem_NoHelp
			xPOWEXPAND
		;
	}
	
	{
		"Reorder"
		::
			TakeOver
			HandleMenuItem
			xREORDER
		;
	}
	
	{
		"\90Mtch"
		::
			TakeOver
			HandleMenuItem_CustomHelp
			xMATCHUP
			"\90MATCH"
		;
	}
	
	{
		"\8FMtch"
		::
			TakeOver
			HandleMenuItem_CustomHelp
			xMATCHDN
			"\8FMATCH"
		;
	}
}
