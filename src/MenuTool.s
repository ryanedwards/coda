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

NULLNAME MenuTool
{
	{
		"View"
		::
			TakeOver
			EditExstCase
				DoBadKey
			
			337    							( Check to make sure Headman is installed. )
			ONSRRP?_
			ITE
			::
				HEADMAN_ViewP     ( Use Headman's ViewP if available. )
			;
			::
				CK1NOLASTWD       ( Otherwise, use the default viewer. )
				DUP
				ViewObject
			;
		;
	}
	{
		"Edit"
		::
			CK1NOLASTWD
			EditLevel1
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
	{
		"Rev"
		::
			TakeOver
			HandleMenuItem_NoHelp
			xREV
		;
	}
	{
		"Help"
		::
			TakeOver
			HandleMenuItem_NoHelp
			xHELP
		;
	}
}
