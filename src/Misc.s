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

( GROB_UpArrow: The up arrow grob used in the menus. )
NULLNAME GROB_UpArrow
GROB 0003A 8000051000E30000FFFFF1FFBFF1FF1FF1FF0EF1FF1FF1FF1FF1FFFFF1


(	Used on menu items for custom RPLMNU commands. This routine could draw a
	custom menu label if desired. )
NULLNAME MakeSpecialLabel
::
	MakeRoundedLabel
;


( Make a menu item label GROB with rounded corners. )
NULLNAME MakeRoundedLabel
::
	BINT20
	BINT11
	GROB 0003A 8000051000FFFFF1100001000000000000000000000000000000100001
	MakeLabel
	INVGROB
;


( Make a menu item label GROB frame. Rounded square brackets. )
NULLNAME MakeBracketLabel
::
	BINT20
	BINT11
*	GROB 0003A 8000051000000000200080100001100001100001100001100001200080 ( Short, 1 Pixel Foot )
*	GROB 0003A 8000051000200080100001100001100001100001100001100001200080 ( Tall, 1 Pixel Foot )
	GROB 0003A 80000510006000C01000011000011000011000011000011000016000C0 ( Tall, 2 Pixel Foot )
*	GROB 0003A 8000051000E000E0100001100001100001100001100001100001E000E0 ( Tall, 3 Pixel Foot )
	MakeLabel
;


( xNAME SplashScreen
::
  xVERSION
  xDROP
	FlashWarning
; )


( This routine is called when the library is attached. )
NULLNAME CONFIG
::
	( Attach this library. )
	1533
	TOSRRP
	
	( Attach the two development libraries: 256 & 257 )
	REALOBOB
	DUP#1+
	TOSRRP
	TOSRRP
	
	ERRSET
	( Check for KEYMAN LIB! )
	ERRTRAP
	::
		"Error: Coda requires KEYMAN+ to be installed."
		FlashWarning
	;
	
	( KEYMAN is required for this library to function! )
*	1200
*	ONSRRP?_
*	NOTcase
*	::
*		"Error: RPLMNU requires KEYMAN to be installed."
*		FlashWarning
*	;
;

NULLNAME CreateGarbageAlarm
::
	( Set up auto garbage collection recurring alarm )
	DATE
  TOD
  %9600_
  %1/
  %HMS+
  '
  ::
    TakeOver
    DROP
    GARBAGE
  ;
  % 81920
  STOALM

  ( Store the alarm number in the hidden CODA_GARBAGE variable. )
	ID CODA_GARBAGE
	StoHiddenVar
;

NULLNAME DeleteGarbageAlarm
::
	ID CODA_GARBAGE
	RclHiddenVar
	IT ( the variable exists )
		PURGALARM%
;
