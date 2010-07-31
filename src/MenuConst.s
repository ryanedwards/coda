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

NULLNAME MenuConst_HandleMenuItem
::
	'R'R
	'R
	KEYMAN_CheckLongHold
	::
		DROPSWAP
		CK&DISPATCH1
		id
		::
			xCONST
			SWAP
			>TAG
		;
		
		seco
		::
			EVAL
		  SWAP
			>TAG
		;
	;
	
	( Long-hold: Display the text describing the constant. )
	UNROT
	2DROP
	DISPCOORD2
;


NULLNAME MenuConst
{
	{
		"c"
		::
			MenuConst_HandleMenuItem
			ID c
			"c"
			"Speed of Light in Vacuum"
		;
	}
	
	{
		"g"
		::
			MenuConst_HandleMenuItem
			ID g
			"g"
			"Standard Acceleration of Gravity"
		;
	}
	
	{
		"G"
		::
			MenuConst_HandleMenuItem
			ID G
			"G"
			"Newtonian Constant of Gravitation"
		;
	}
	
	{
		"\930"
		::
			MenuConst_HandleMenuItem
			ID \930
			"\930"
			"Permittivity of Free Space"
		;
	}
	
	{
		"\B50"
		::
			MenuConst_HandleMenuItem
			ID \B50
			"\B50"
			"Permeability of Free Space"
		;
	}
	
	{
		"Z0"
		::
			MenuConst_HandleMenuItem
			::
				ID c
				xCONST
				ID \B50
				xCONST
				x*
			;
			"Z0"
			"Impedance of Free Space"
		;
	}
	
	( Page 2 )
	{
		"k"
		::
			MenuConst_HandleMenuItem
			ID k
			"k"
			"Boltzmann Constant"
		;
	}
	
	{
		"\98"
		::
			MenuConst_HandleMenuItem
			ID \98
			"\98"
			"Stefan-Boltzmann Constant"
		;
	}
	
	{
		"kC"
		::
			MenuConst_HandleMenuItem
			::
				ID \930
				xCONST
				%4
				x*
				xPI
				x*
				xINV
				x>NUM
			;
			"kC"
			"Coulomb's Constant"
		;
	}
	
	{
		"b"
		::
			MenuConst_HandleMenuItem
			ID c3
			"b"
			"Wien's Displacement Constant"
		;
	}
	
	{
		"R"
		::
			MenuConst_HandleMenuItem
			ID R
			"R"
			"Universal Gas Constant"
		;
	}
	
	{
		"F"
		::
			MenuConst_HandleMenuItem
			ID F
			"F"
			"Faraday Constant"
		;
	}
	
	( Page 3 )
	{
		"NA"
		::
			MenuConst_HandleMenuItem
			ID NA
			"NA"
			"Avogadro's Number"
		;
	}
	
	{
		"q"
		::
			MenuConst_HandleMenuItem
			ID q
			"q"
			"Elementary Charge"
		;
	}
	
	{
		"me"
		::
			MenuConst_HandleMenuItem
			ID me
			"me"
			"Electron Mass"
		;
	}
	
	{
		"mp"
		::
			MenuConst_HandleMenuItem
			ID mp
			"mp"
			"Proton Mass"
		;
	}
	
	{
		"mn"
		::
			"Neutron Mass"
		;
	}
	
	{
		"u"
		::
			"Atomic Mass Constant"	
		;
	}
	
	
	( Page 4 )
	{
		"h"
		::
			MenuConst_HandleMenuItem
			ID h
			"h"
			"Planck's Constant"
		;
	}
	
	{
		"hbar"
		::
			MenuConst_HandleMenuItem
			ID hbar
			"hbar"
			"Dirac's Constant"
		;
	}
	
	{
		"e"
		::
			"Logarithmic Constant"	
		;
	}
	
	{
		"atm"
		::
			"Standard Atmosphere"	
		;
	}
	
	{
		"Sound"
		::
			"Speed of Sound at Sea Level"	
		;
	}
	
	{
		"u"
		::
			"Golden Ratio"	
		;
	}
	
	
	
	( Toggle units on/off )
	{
		::
			TakeOver
			"Units"
			BINT61
			TestUserFlag
			NOT_IT
			MakeBoxLabel
		;
		::
			TakeOver
			BINT61
			DUP
			UserITE
			ClrUserFlag
			SetUserFlag
		;
	}
	
	( Set to SI units. )
	{
		::
			TakeOver
			"SI"
			BINT60
			TestUserFlag
			NOT_IT
			MakeBoxLabel
		;
		::
			TakeOver
			BINT60
			ClrUserFlag
		;
	}
	
	( Set to Imperial units. )
	{
		::
			TakeOver
			"Engl"
			BINT60
			TestUserFlag
			IT
			MakeBoxLabel
		;
		::
			TakeOver
			BINT60
			SetUserFlag
		;
	}
	
	NullMenuKey
	
	xCONLIB	
	xCONST
}
