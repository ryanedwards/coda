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

( Old version of PRESX, not as accurate because there are lots of divides. )
( xNAME PRES1
::
	CKN
	#1+
	BINT1
	%0
	UNROT
	DO
		SWAP
		CKREAL
		%1/
		%+
	LOOP
	%1/
; )

( NEEDS: Proper argument checking. Check for real/zint and use reals/zints depending on calculator mode. )
xNAME PRESX
::
	xOBJ>
	Z1_
	x-
	Z1_
	DUPROT
	xSTART
		3PICK
		x*
		OVER
		x+
		3UNROLL
		x*
		SWAP
	xNEXT
	x/
;


xNAME R12
::
	xRPN->
	LAM R
	x<<
	LAM R
	xMANT
	xRPN->
	LAM M
	x<<
	{
		%1
		% 1.2
		% 1.5
		% 1.8
		% 2.2
		% 2.7
		% 3.3
		% 3.9
		% 4.7
		% 5.6
		% 6.8
		% 8.2
		% 10.
	}
	x'
	ID L1
	xENDTIC
	xSTO
	%0
	xDO
	%1
	x+
	xDUP
	x'
	ID L1
	xENDTIC
	xSWAP
	xGET
	xUNTIL
	LAM M
	x>=?
	xENDDO
	xDUP
	x'
	ID L1
	xENDTIC
	xSWAP
	xGET
	LAM M
	x/
	xRPN->
	LAM B
	x<<
	%1
	x-
	x'
	ID L1
	xENDTIC
	xSWAP
	xGET
	LAM M
	x/
	xINV
	xRPN->
	LAM A
	x<<
	LAM A
	LAM B
	xIF
	x>=?
	xTHEN
	::
		LAM R
		LAM B
		x*
	;
	xELSE
	::
		LAM R
		LAM A
		x/
	;
	xIFEND
	%-2
	xRND
	x>>ABND
	x>>ABND
	x>>ABND
	x>>ABND
	x'
	ID L1
	xENDTIC
	xPURGE
;

xNAME R24
::
	x<<
	xRPN->
	LAM R
	x<<
	LAM R
	xMANT
	xRPN->
	LAM M
	x<<
	{
		% .91
		%1
		% 1.1
		% 1.2
		% 1.3
		% 1.5
		% 1.6
		% 1.8
		%2
		% 2.2
		% 2.4
		% 2.7
		%3
		% 3.3
		% 3.6
		% 3.9
		% 4.3
		% 4.7
		% 5.1
		% 5.6
		% 6.2
		% 6.8
		% 7.5
		% 8.2
		% 9.1
		% 10.
	}
	x'
	ID L1
	xENDTIC
	xSTO
	%0
	xDO
	%1
	x+
	xDUP
	x'
	ID L1
	xENDTIC
	xSWAP
	xGET
	xUNTIL
	LAM M
	x>=?
	xENDDO
	xDUP
	x'
	ID L1
	xENDTIC
	xSWAP
	xGET
	LAM M
	x/
	xRPN->
	LAM B
	x<<
	%1
	x-
	x'
	ID L1
	xENDTIC
	xSWAP
	xGET
	LAM M
	x/
	xINV
	xRPN->
	LAM A
	x<<
	LAM A
	LAM B
	xIF
	x>=?
	xTHEN
	::
		LAM R
		LAM B
		x*
	;
	xELSE
	::
		LAM R
		LAM A
		x/
	;
	xIFEND
	%-2
	xRND
	x>>ABND
	x>>ABND
	x>>ABND
	x>>ABND
	x'
	ID L1
	xENDTIC
	xPURGE
	x>>
;


xNAME R48
::
  x<<
  SYMBOL
    ZINT 10
    Z1_
    ZINT 48
    x/
    x^
  ;
  xALG->
  LAM x
  LAM y
  SYMBOL
    LAM y
    LAM x
    LAM y
    xSQRT
    x*
    xLN
    LAM y
    xLN
    x/
    xIP
    x^
  ;
  xEVAL
  Z-3_
  xRND
  x>>
;


xNAME R96
::
  x<<
  SYMBOL
    ZINT 10
    Z1_
    ZINT 96
    x/
    x^
  ;
  xALG->
  LAM x
  LAM y
  SYMBOL
    LAM y
    LAM x
    LAM y
    xSQRT
    x*
    xLN
    LAM y
    xLN
    x/
    xIP
    x^
  ;
  xEVAL
  Z-3_
  xRND
  x>>
;
