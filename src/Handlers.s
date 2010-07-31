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


( HandleStartup: This routine is for initializing the calculator after
	a warm boot. It sets various flags and initial settings. Should be
	called by the STARTUP program. )
NULLNAME HandleStartup
::
	DOSTD						( Standard Number Formatting )
	SETDEG          ( Degree Angle Mode )
	DOHEX						( Hexadecimal Number Mode )
	BINT16          ( Set Rectangular Mode )
	ClrSysFlag
	
	BINT64					( Set the wordsize to 64 bits )
	dostws
	
	BINT2           ( Set the header to height of 2 )
	SetHeader
	
									( NEED TO SET THE DEFAULT CAS VARIABLE )
									
									( NEED TO SET THE DEFAULT FONT )
									
	% 200.          ( Set the key delay interval )
	x\->KEYTIME
	
	( Set system flags )
	{
		% -28
		% -40
		% -42
		% -56
		% -57
		% -59
		% -61
		% -62
		% -74
		% -117
	}
	xSF
	
	( Clear system flags )
	{
		%-2
		%-3
		% -27
		% -52
		% -65
		% -73
		% -92
		% -95
		% -103
		% -105
	}
	xCF
	
	BINT33					( Display the RPLMNU Tools menu. )
	DoCustomMenu1	
;


( HandlePoweroff: Handles shutdown by doing a garbage collection, and
	then displaying a counter in the corner of the screen that counts
	down until the calculator turns off. This may give the user a heads
	up to when the calculator is powering off. Pressing any key during
	the countdown will abort it and continue as normal. The keypress to
	abort is not lost and will perform its normal behavior.
	
	This is an updated version of Wolfgang Rautenberg's code from his
	Headman library and others. )
DEFINE	kHandleShutdown_XPosStack		BINT99
DEFINE	kHandleShutdown_YPosStack		BINT2
DEFINE	kHandleShutdown_XPosApp			BINT0
DEFINE	kHandleShutdown_YPosApp			BINT0
NULLNAME HandleShutdown
::
	GARBAGE
	TurnOff
;
(	
*	Do nothing if an edit is in progress.
*	EditLExists?
*	?SEMI
	
*	10 second countdown before turning off.
	BINT10
	DUP
	BINT0
	DO
*		Update the status header with the count.
		ISTOP-INDEX
		SWAPDROP#1-_		
*		AppMode?
*		ITE
*		::			
			#>$
			"Automatic shutdown in: "
			!insert$
			$>grobCR
			
			Clr8
			Save16Patch_
			SWAPOVER
			
			kHandlePoweroff_XPosApp
			kHandlePoweroff_YPosApp
			GROB!
			Rest16Patch_	
*		;
*		::
*			Save16Patch_
*			kHandlePoweroff_XPosStack
*			kHandlePoweroff_YPosStack
*			4ROLL
*			#>$
*			BINT4
*			ERASE&LEFT$3x5
*			Rest16Patch_
*		;
		
*   Wait 1 second before updating again.
		%1
		dowait
		
*   Cancel the loop if a key is pressed.
		CHECKKEY
		ITE
		ExitAtLOOP
		ATTN?
	LOOP
	
* Clear the countdown numbers, but only if not in an application like
* the equation editor. That way we don't get a nasty floating clock or
* other garbage.
	AppMode?
	NOT_IT
	DispStatus
	
* Turn the calc off if no keys were pressed.
	NOT
	IT
	TurnOff
; )


( HandleEditorStart: Called when the built-in editor is opening. Hides
	the header - sets height to zero. )
NULLNAME HandleEditorStart
::
	BINT0
	SetHeader
	BINT73
	SetSysFlag
;


( HandleEditorExit: Called when the built-in editor is exiting.
	Returns the header size to the previous setting - default is 2.
	
	TODO: Need to change this to restore the header to the previous
	setting. The user may have chosen 1 or 0 as the default. )
NULLNAME HandleEditorExit
::
	BINT2
	SetHeader
	BINT73
	ClrSysFlag
;


( HandleError: A nicer appearing error display that shows the error in
	the header section on the screen along with an exclamation style
	warning icon. Uses small print.
	
	Based on Wolfgang Rautenburg's StErr program from his HeadMan
	library. )
NULLNAME HandleError
::
	( Get the argument and convert it into a string. )
	DUPNULL$?
	IT
	::
		DROP
		"Unknown Error"
	;
	$>grobCR	
	SWAP
	$>grobCR

  grobAlertIcon
  	
  ( Create a new blank grob of the header size. )
	BINT14
  BINT_131d
  MAKEGROB

	( Put the alert icon in the grob. )
	DUPUNROT
	BINT2
	BINT2
  GROB!

  ( Put the error command description in the grob. )
  DUPUNROT
	BINT14
  BINT1
  GROB!

 	( Put the error message in the grob. )
	DUPUNROT
	BINT14
  BINT8
  GROB!

  ( Display in the header area. )
  Save16Patch_
  DUPUNROT
  ZEROZERO
  GROB!
  Rest16Patch_
  SetDA1Temp

  ERRBEEP

  ( Might as well do a garbage collection as the user pauses to figure out what
  	he's done wrong. )
	GARBAGE
;


( HandleExtProg: Handles messages from the operating system. Menu
	integration, built-in help menu support, etc. )
NULLNAME HandleExtProg
::
	( # FFFFF
	OVER#=
	case
	::
		
		x+
		SWAP
	; )
	
	( Other message numbers can be handled as well, using the xNNNNN OVER#= case :: ... ; template. )
;
