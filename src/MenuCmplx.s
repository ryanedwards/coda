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

NULLNAME MenuCmplx
{
	{
		"i"
		::
			TakeOver
			HandleMenuItem
			xi
		;
	}
	
	{
		"\80"
		::
			( SHOULD ADD SOME CODE FOR HELP HERE? )
			TakeOver
			FLASHPTR COMPLEXON
			% 128
			DOCHR
			CMD_PLUS
		;
	}
	
	{
		"R\8DC"
		::
			TakeOver
			HandleMenuItem_CustomHelp
			xR>C
			"R>C"
		;
	}
	
	{
		"C\8DR"
		::
			TakeOver
			HandleMenuItem_CustomHelp
			xC>R
			"C>R"
		;
	}
	
	{
		"Conj"
		::
			TakeOver
			HandleMenuItem
			xCONJ
		;
	}
	
	{
		"Arg"
		::
			TakeOver
			HandleMenuItem
			xARG
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
		"IM"
		::
			TakeOver
			HandleMenuItem
			xIM
		;
	}
	
	{
		"RE"
		::
			TakeOver
			HandleMenuItem
			xRE
		;
	}
}
