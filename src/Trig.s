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


( CSC: Cosecant Function )
xNAME CSC
::
	CK1
	'
	xSIN
	EvalNoCK
	'
	xINV
	EvalNoCK
;


( SEC: Secant Function )
xNAME SEC
::
	CK1
	'
	xCOS
	EvalNoCK
	'
	xINV
	EvalNoCK
;


( COT: Cotangent Function )
xNAME COT
::
	CK1
	'
	xTAN
	EvalNoCK
	'
	xINV
	EvalNoCK
;


( ACSC: Inverse Cosecant Function )
xNAME ACSC
::
	CK1
	'
	xINV
	EvalNoCK
	'
	xASIN
	EvalNoCK
;


( ASEC: Inverse Secant Function )
xNAME ASEC
::
	CK1
	'
	xINV
	EvalNoCK
	'
	xACOS
	EvalNoCK
;


( ACOT: Inverse Cotangent Function )
xNAME ACOT
::
	CK1
	'
	xINV
	EvalNoCK
	'
	xATAN
	EvalNoCK
;


( CSC: Hyperbolic Cosecant Function )
xNAME CSCH
::
	CK1
	'
	xSINH
	EvalNoCK
	'
	xINV
	EvalNoCK
;


( SEC: Hyperbolic Secant Function )
xNAME SECH
::
	CK1
	'
	xCOSH
	EvalNoCK
	'
	xINV
	EvalNoCK
;


( COT: Hyperbolic Cotangent Function )
xNAME COTH
::
	CK1
	'
	xTANH
	EvalNoCK
	'
	xINV
	EvalNoCK
;


( ACSC: Inverse Hyperbolic Cosecant Function )
xNAME ACSCH
::
	CK1
	'
	xINV
	EvalNoCK
	'
	xASINH
	EvalNoCK
;


( ASEC: Inverse Hyperbolic Secant Function )
xNAME ASECH
::
	CK1
	'
	xINV
	EvalNoCK
	'
	xACOSH
	EvalNoCK
;


( ACOT: Inverse Hyperbolic Cotangent Function )
xNAME ACOTH
::
	CK1
	'
	xINV
	EvalNoCK
	'
	xATANH
	EvalNoCK
;
