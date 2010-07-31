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

( %D: Percent Difference )
xNAME \25D
::
	CK2&Dispatch
	2REAL
	::
		2DUP
		%CH
		UNROTSWAP
		%CH
		
		2DUP
		%MAX
		"\25\90"
		TAGOBS
		
		UNROT
		%MIN
		%ABS
		"\25\8F"
		TAGOBS
	;
;


( REV: Reverse the stack order. )
xNAME REV
::
	CK2
	DEPTH	
	#1+
	BINT2
	DO
		INDEX@
		ROLL
	LOOP
;



( RNDUP: Rounds the number in Level 2 UP to the nearest multiple of
	the number in Level 1. )
xNAME RND\90
::
	CK2&Dispatch
	2REAL
	::
		SWAP
		OVER
		%/
		%CEIL
		%*
	;
;


( RNDDN: Rounds the number in Level 2 DOWN to the nearest multiple of
	the number in Level 1. )
xNAME RND\8F
::
	CK2&Dispatch
	2REAL
	::
		OVER
		SWAP
		%MOD
		%-
	;
;


( RNDNR: Rounds the number in Level 2 to the nearest multiple of the
	number in Level 1, be it up OR down. )
xNAME RND\90\8F
::
	CK2&Dispatch
	2REAL
	::
		SWAP
		OVER
		%/
		%0
		RNDXY
		%*
	;
;
