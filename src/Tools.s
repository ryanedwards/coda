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

( FILER6: Wolfgang Rautenburg's Filer 6 program.
	Version: 5.2004 )
xNAME FILER6
INCLOB FILER6.hp


( BZ2: BZ2 is a compression engine completely compatible with the
	original BZ from Mika Heiskannen and its evolution BZ49. BZ2
	objectives are to compress & decode faster than BZ, while achieving
	at the same time higher compression ratio. Thanks to full
	compatibility, BZ2 and BZ1 can decode each other.
	Version: BZ2 Final, Update 2 )
xNAME BZ2
INCLOB BZ2.hp


( TNT2: A version of BZ2 with Elias Gamma Code compatible with the TNT
	style encoding. Fully compatible with the TNT format.
	Version: 1.1 )
xNAME TNT2
INCLOB TNT2.hp


( LZD: An LZ77-class compressor developed to reach fast decoding
	speed, multiple times faster than standard compressors. LZD prime
	advantage is its decoding speed, but it also compresses fast, and
	features strong compression ratio on small <1KB and complex objects.
	Version: 0.4b )
xNAME LZD
INCLOB LZD.hp


( ->TOFF: Given a time in seconds, sets the time of inactivity
	before the calulator will shut off automatically. Checks for
	valid range before storing.	
	Acceptable numbers from a post by John Myers on comp.sys.hp48. )
xNAME \8DTOFF
::
	CK1&Dispatch
	real
	::
		( Check to make sure the given value is within the valid
			range. 5 seconds to 2^31 - 1 seconds. Of course, that maximum
			value is longer than 68 years, so kind of useless. )
		DUPDUP
		%4
		%>
		SWAP
		% 2147483648
		%<
		AND
		NOTcase
			SETSIZEERR	
		
		( Convert from a real in seconds to a user BINT in ticks. )
		%TICKSsec_
		%*
		%>#
		
		( Store the value in the TOFF variable. )
		PUSHFLAGS_
		HOMEDIR
		'
		ID TOFF
		STO
		POPFLAGS_
	;
;


( TOFF->: Retrieves the current value of TOFF. If the variable
	does not exist, returns the default value of 300 seconds. )
xNAME TOFF\8D
::
	CK0
	ERRSET
	::		
		( Retrieve the contents of the TOFF variable. )
		PUSHFLAGS_
		HOMEDIR
		'
		ID TOFF
		XEQRCL
		POPFLAGS_
	
		( Convert from ticks to seconds and to a real. )
		HXS>%
		%TICKSsec_
		%/
	;
	ERRTRAP
	::
		POPFLAGS_
		% 300
	;
;


( HdrMsg: Displays the given string in the header area.
	NEED TO FIX THIS! It does nothing if the header is level 0 or 1 )
xNAME HdrMsg
::
	CK1&Dispatch
	str
	::
		EditLExists?
		case
			DROP
		
		$>grobCR
		
		DispStatus
		Save16Patch_
		BINT67
		BINT7
		BINT131
		BINT13
		GROB!ZERO
		
		SWAP2DUP
		GROBDIMw
		DUP
		BINT64
		#<=_
		ITE
		::
			132
			SWAP
			#-
			BINT1
			GROB!
			Rest16Patch_
			SetDA1Temp
		;
		::
			4DROP
			SETSIZEERR
		;
	;
;


( MEM1: Displays the free bytes remaining in Port 1. )
xNAME MEM1
::
	%1
  xPVARS
  SWAPDROP
;


( MEM2: Displays the free bytes remaining in Port 2. )
xNAME MEM2
::
	%2
  xPVARS
  SWAPDROP
;


( DSort: Sorts the current directory alphabetically. )
xNAME DSort
::
	CK0
	DOVARS
	xSORT
	XEQORDER
;


( Defrag: Sorts the current directory. Puts directories first,
	followed by programs, and then everything else. Everything is sorted
	alphabetically within each category. )
xNAME Defrag
::
	( Get list of directories. )
	%15
  DOTVARS%
  xSORT

	( Get list of programs. )
  %8
  DOTVARS%
  xSORT

	( Get list of everything else. Duplicates already pulled above will
		be ignored during the adds below. )
	DOVARS
	xSORT

  ( Add lists together and commit as the new directory order. )
  x+
  x+
  XEQORDER
;


( KeyDec: Given a keycode in the user format rc.plane, returns the
	keycode as two reals in system format. )
xNAME KeyDec
::
	CK1&Dispatch
	real
	::
		Ck&DecKeyLoc
		SWAP
		BINT64
		#/
		ROTSWAP
		#0=?SKIP
		#6+
		UNCOERCE2
	;
;


( KeyObj: Given a keycode in the user format rc.plane, returns the
	default action performed by the key. )
xNAME KeyObj
::
 	CK1&Dispatch
 	real
 	::
 		Ck&DecKeyLoc
 		Key>StdKeyOb
 	;
;


( Addr table:
==========
[ON]&[C]     : #00C30
[ON]&[D]     : #00C46
[ON]&[E]     : #00C5C
[ON]&[F]     : #00C72
[ON]&[A]&[F] : #00BEE )
( ONC: Performs a soft reset of the calculator. Performs the same
	action as pressing ON-C. )
xNAME ONC
CODEM
	GOSBVL	=DisableIntr  % Disable interrupts (imperative)
	LA			#00C30     		% Load the memory location of the ON-C routine into A
	PC=(A)            		% Unconditionally jump to the location in A
ENDCODE

( ONF: Enters the calculator self-diagnostic mode. Performs the same
	action as pressing ON-D. )
xNAME ONF
CODEM
	GOSBVL	=DisableIntr  % Disable interrupts (imperative)
	LA			#00C72     		% Load the memory location of the ON-F routine into A
	PC=(A)            		% Unconditionally jump to the location in A
ENDCODE
