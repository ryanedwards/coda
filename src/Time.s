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

INCLUDE	CODA.h
INCLUDE	Definitions.h

( LpYr?: Given a 4-digit year, returns a boolean specifying if it is a
	leap year. Gregorian Calendar only. )
xNAME	LPYR\3F
::
	CK1&Dispatch
	real
	::
		DUPDUP
		
		%4
		%MOD
		XEQNOT_
		ROT
		
		%	100.
		%MOD
		XEQAND_
		SWAP
		
		%	400.
		%MOD
		XEQNOT_
		XEQOR_
	;
;


( WkDay: Given any date in standard HP format, returns the day of the
	week from 1-7. 1=Sun, 7=Sat, Gregorian Calendar only. )
xNAME	WKDAY
::
	CK1&Dispatch
	real
	::
		( Parse month from date. Considers year to begin in March,
		so subtract 2 and add 12 if less than 0 i.e Jan or Feb )
		DUP
		%FLOOR
		%2
		%-
		DUP
		%1
		%<
		IT
		::
			%	12.
			%+
		;
		
		( Parse day from date. )
		SWAP
		%FP
		%	100.
		%*
		DUP
		%FLOOR
		
		( Parse 2-digit century from the date. )
		SWAP
		%FP
		%	100.
		%*
		DUP
		%FLOOR
		
		( Parse 2-digit year from the date. )
		SWAP
		%FP
		%	100.
		%*
		
		( Calculate Y/4 FLOOR + Y )
		DUP
		%4
		%/
		%FLOOR
		%+
		
		( Calculate C/4 FLOOR - 2*C and add to previous calc. )
		SWAPDUP
		%-2
		%*
		SWAP
		%4
		%/
		%FLOOR
		%+
		%+
		
		( Add days to previous calc. )
		%+
		
		( Calculate 2.6*m - 0.2 FLOOR and add to previous calc. )
		SWAP
		%	2.6
		%*
		%	.2
		%-
		%FLOOR
		%+
		
		( MOD 7 and add 1 to adjust day to start with 1 on Sun. )
		%7
		%MOD
		%1+
	;
;
