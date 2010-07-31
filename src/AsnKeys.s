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

xNAME AsnKeys
::
	( Make sure the user wants to replace their keys! )	
*	"Warning: This program\0Areplaces all user\0Akeys, STARTOFF,\0ASTARTED, and\0AEXITED."
*	BINT1
*	BINT6
*	Disp5x7
	"Apply RPLMNU Config?"
	AskQuestion
	NOT?SEMI
	
	HOMEDIR
	( Create the STARTOFF program. )
	'
	::
		HandleShutdown
	;
	'
	ID STARTOFF
	STO
	
	
	( Create the STARTUP program. )
	'
	::
		HandleStartup
	;
	'
	ID STARTUP
	STO
	
	
	( Create the STARTERR program. )
	'
	::
		HandleError
	;
	'
	ID STARTERR
	STO
	
	
	( Create the STARTED program. )
	'
	::
		HandleEditorStart
	;
	'
	ID STARTED
	STO
	
	
	( Create the EXITED program. )
	'
	::
		HandleEditorExit
	;
	'
	ID EXITED
	STO
	
	
	( Create the BENTER program. )
*	'
*	::
*		VectoredEnterHandler
*	;
*	'
*	ID \DFENTER
*	STO
	
	
	( Get a copy of all the current user keys to the stack. )
	GetUserKeys
	
	( Delete the current user keys. )
	%0
	xDELKEYS
		
	( Restore the previously assigned function of the Units key. )
	BINT40
	NTHELCOMP
	IT
	::
		BINT3
		NTHELCOMP
		IT
		::	
			BINT40
			BINT3
			StoUserKeypatch_
		;
	;
	
	
	(	------------------------------------------------------- )
	(	22.1	Apps
	(
	(	Apps Menus
	(	Tap Key: 	Coda Apps Menu
	(	Hold Key:	HP Applications Choosebox
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		KEYMAN_CheckLongHold
		::
			mApps
			DoCustomMenu1
		;
		BINT7
		BINT1
		Key>StdKeyOb
		DoKeyOb
	;
	BINT7
	BINT1
	StoUserKeypatch_
	
	
	(	------------------------------------------------------- )
	(	21.2 	LS-Apps
	(
	(	Custom Filer
	( Starts Wolfgang Rautenberg's Filer 6.
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		AppMode?
		?SEMI
		xFILER6
	;
	BINT7
	BINT2
	StoUserKeypatch_


	(	------------------------------------------------------- )
	( 21.21	LSH-Apps
	(
	(	HP Filer
	( Starts the built-in HP Filer.
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		BINT7
		BINT2
		Key>StdKeyOb
		DoKeyOb
	;
	BINT7
	BINT8
	StoUserKeypatch_


	(	------------------------------------------------------- )
	( 21.31	RSH-Apps
	(
	(	Angle Mode Toggle
	( Toggles between Rad-Deg or Rad-Grad.
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		CK0NOLASTWD
		BINT17
		DUP
		SysITE
		ClrSysFlag
		SetSysFlag
	;
	BINT7
	BINT9
	StoUserKeypatch_


 	(	------------------------------------------------------- )
	(	22.1	Mode
	(
	(	Modes Menus
	(	Tap Key: 	RPLMNU Modes Menu
	(	Hold Key:	HP Modes Choosebox
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		KEYMAN_CheckLongHold
		::
			mMode
			DoCustomMenu1
		;
		BINT8
		BINT1
		Key>StdKeyOb
		DoKeyOb
	;
	BINT8
	BINT1
	StoUserKeypatch_


	(	------------------------------------------------------- )
	(	22.21	LSH-Mode
	(
	(	RPLMNU Number Format Menu
	( Displays the RPLMNU menu with options to choose the
	(	number display format.
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mModeFormat
		DoCustomMenu1
	;
	BINT8
	BINT8
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	22.31	RSH-Mode
	(
	(	Coordinate Mode Toggle
	( Toggles between Rectangular and Polar or Rectangular
	(	and Sperical coordinate modes.
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		CK0NOLASTWD
		BINT16
		DUP
		SysITE
			ClrSysFlag
			SetSysFlag
	;
	BINT8
	BINT9
	StoUserKeypatch_


  (	------------------------------------------------------- )
	( 23.1	Tool
	(
	(	RPLMNU Tools Menu
	( Displays the RPLMNU Tools menu.
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mTool
		DoCustomMenu1
	;
	BINT9
	BINT1
	StoUserKeypatch_


  (	------------------------------------------------------- )
	( 23.31	RSH-Tool
	(
	(	RPLMNU Number Format Menu
	( Displays the RPLMNU menu with options to choose the
	(	number display format.
	(	------------------------------------------------------- )
*	'
*	::
*		TakeOver
*		mModesFormat
*		DoCustomMenu1
*	;
*	BINT9
*	BINT9
*	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	25.31	RSH-Up Arrow
	(	25.61 Alpha-RSH-Up Arrow
	(
	(	Emacs Programming Helpers (if installed)
	( Tap Key: 	Emacs SDIAG
	(	Hold Key: Emacs EDOB
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		1790    							( Check to make sure Emacs is installed. )
		ROMPARTNAME_
		casedrop
		::
			KEYMAN_CheckLongHold
				EMACS_SDIAG				( Start SDIAG )
			EMACS_EDOB					( Start EDOB )
		;
	;
	BINT10
	2DUP
	BINT9
	StoUserKeypatch_
	BINT12
	StoUserKeypatch_


  (	------------------------------------------------------- )
	( 32.1	Sto
	(
	( Tap Key: 	STO (Default Function)
	(	Hold Key: KEYMAN Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		KEYMAN_CheckLongHold
		::
			BINT12
			BINT1
			Key>StdKeyOb
			DoKeyOb
		;
		%1200_
		InitMenu%
	;
	BINT12
	BINT1
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	32.21	LSH-Sto
	(
	(	KEYMAN RclK
	(	Runs RclK which returns the currently assigned function
	( of the pressed key.
	(	------------------------------------------------------- )
	'
	::
		KEYMAN_RclK
	;
	BINT12
	BINT8
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	32.3 RS-Sto
	(
	(	Edit: 	CUT (Default)
	(	Stack: 	KEYMAN More Choosebox
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		EditExstCase
		::
			BINT12
			BINT3
			Key>StdKeyOb
			DoKeyOb
		;
		KEYMAN_More					( Start KEYMAN More )
	;
	BINT12
	BINT3
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	32.31	RSH-Sto
	(
	(	KEYMAN K&SA
	( Runs K&SA which returns the builtin assignment of the
	(	pressed key.
	(	------------------------------------------------------- )
	'
	::
		KEYMAN_K&SA
	;
	BINT12
	BINT9
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	34.1	Left
	(
	(	Edit Mode: 				Left Arrow (Default)
	(	Tap Key @ Stack:  UPDIR
	(	Hold Key @ Stack: HOME
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		EditExstCase
			CMD_BAK
		KEYMAN_CheckLongHold
			xUPDIR
		xHOME
	;
	BINT14
	BINT1
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	35.1	Down
	(
	(	Edit: 	Down Arrow
	(	Stack: 	Edit / View
	(	At the stack, calls EDIT on any object that is not a
	(	variable. Calls VIEW on a variable ID to edit its contents.
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		NoEdit?case
		::
			CK1NOLASTWD
			BINT95
			SysITE
				AlgObEdit
			::
				CK&DISPATCH1
				id
				Rcl&View_
				lam
				Rcl&View_
				any
				ViewLevel1
			;
		;
		CMD_DOWN
	;
	BINT15
	BINT1
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	35.31	RSH-Down
	(
	(	RPLED Emacs Edit (if installed)
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		1790    							( Check to make sure Emacs is installed. )
		ONSRRP?_
		case
		::
			EMACS_RPLED					( Start Emacs RPLED )
		;
	;
	BINT15
	BINT9
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	36.1	Right
	(
	(	Edit Mode:				Right Arrow (Default)
	(	Tap Key @ Stack: 	SWAP
	(	Hold Key @ Stack:	OVER
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		EditExstCase
			CMD_NXT
		KEYMAN_CheckLongHold
			xSWAP
		xOVER
	;
	BINT16
	BINT1
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	36.21	LSH-Right
	(	36.51	Alpha-LSH-Right
	(
	(	DYNCPL Emacs Dynamic Completion (if installed)
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		1790    							( Check to make sure Emacs is installed. )
		ONSRRP?_
		case
		::
			EditExstCase
				EMACS_DYNCPL			( Start Emacs DYNCPL )
		;
	;
	BINT16
	2DUP
	BINT8
	StoUserKeypatch_
	BINT11
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	36.31	RSH-Right
	(	36.61 Alpha-RSH-Right
	(
	(	Stack: 	Start KERMIT Server
	(	Edit: 	RPLCPL Emacs RPL Completion (if installed)
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		1790    							( Check to make sure Emacs is installed. )
		ONSRRP?_
		ITE
		::
			EditExstCase
				EMACS_RPLCPL			( Start Emacs RPLCPL )
			xSERVER
		;
		xSERVER
	;
	BINT16
	2DUP
	BINT9
	StoUserKeypatch_
	BINT12
	StoUserKeypatch_



( *41.1 -63 Set: CONT
*     -63 Clr: Default
	'
	::
		TakeOver
		BINT63
		SysITE
		xCONT
		::
			BINT17
			BINT95
			SysITE
			BINT1
			BINT3
			Key>StdKeyOb
			DoKeyOb
		;
	;
	BINT17
	BINT1
	StoUserKeypatch_


*41.3 -63 Set: KILL
*     -63 Clr: Default
	'
	::
		TakeOver
		BINT63
		SysITE
		xKILL
		::
			BINT17
			BINT3
			Key>StdKeyOb
			DoKeyOb
		;
	;
	BINT17
	BINT3
	StoUserKeypatch_ )


  (	------------------------------------------------------- )
	(	42.2	LS-Eval
	(
	(	RPLMNU Programming Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mPrg
		DoCustomMenu1
	;
	BINT18
	BINT2
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	42.21	LSH-Eval
	(
	(	RPLMNU Programming/MASD Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mPrgDev
		DoCustomMenu1
	;
	BINT18
	BINT8
	StoUserKeypatch_

	
  (	------------------------------------------------------- )
	(	42.31 RSH-Eval
	(
	(	RPLMNU Programming/Characters Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mPrgChar
		DoCustomMenu1
	;
	BINT18
	BINT9
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	43.1	'
	(
	(	Tap Key:	Default
	(	Hold Key:	OT49 Menu (if installed)
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		360
		ONSRRP?_
		ITE
		::
			KEYMAN_CheckLongHold
			::
				BINT19
				BINT1
				Key>StdKeyOb
				DoKeyOb
			;
			%360
			InitMenu%
		;
		::
			BINT19
			BINT1
			Key>StdKeyOb
			DoKeyOb
		;
	;
	BINT19
	BINT1
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	44.1	Symb
	(
	(	RPLMNU Symbolic Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mSymbolic
		DoCustomMenu1
	;
	BINT20
	BINT1
	StoUserKeypatch_
	
	
	(	------------------------------------------------------- )
	(	44.2	LS-Symb
	(
	(	RPLMNU General Math Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mMath
		DoCustomMenu1
	;
	BINT20
	BINT2
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	45.1	Drop
	(
	(	Tap Key:	Default Action
	(	Hold Key: Clear Stack
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		EditExstCase
			CMD_DROP
		CacheStack
		KEYMAN_CheckLongHold
			xDROP
		xCLEAR
	;
	BINT21
	BINT1
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	45.31	RSH-Drop
	(
	(	Purge Variable
	(	------------------------------------------------------- )
	'
	::
		xPURGE
	;
	BINT21
	BINT9
	StoUserKeypatch_
	
	
	(	------------------------------------------------------- )
	(	53.1	SIN
	(
	(	Tap Key:	SIN
	( Hold Key: CSC
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		::		
			KEYMAN_CheckLongHold
			:: ' xSIN	;
			' xCSC
		;
		HandleMenuItem_EvalObject
	;
	BINT24
	BINT1
	StoUserKeypatch_
	
	
	(	------------------------------------------------------- )
	(	54.2	ASIN
	(
	(	Tap Key:	ASIN
	( Hold Key: ACSC
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		::		
			KEYMAN_CheckLongHold
			:: ' xASIN ;
			' xACSC
		;
		HandleMenuItem_EvalObject
	;
	BINT24
	BINT2
	StoUserKeypatch_
	
	
	(	------------------------------------------------------- )
	(	54.1	COS
	(
	(	Tap Key:	COS
	( Hold Key: SEC
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		::		
			KEYMAN_CheckLongHold
			:: ' xCOS ;
			' xSEC
		;
		HandleMenuItem_EvalObject
	;
	BINT25
	BINT1
	StoUserKeypatch_
	
	
	(	------------------------------------------------------- )
	(	54.2	ACOS
	(
	(	Tap Key:	ACOS
	( Hold Key: ASEC
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		::		
			KEYMAN_CheckLongHold
			:: ' xACOS ;
			' xASEC
		;
		HandleMenuItem_EvalObject
	;
	BINT25
	BINT2
	StoUserKeypatch_
		
	
	(	------------------------------------------------------- )
	(	54.1	TAN
	(
	(	Tap Key:	TAN
	( Hold Key: COT
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		::		
			KEYMAN_CheckLongHold
			:: ' xTAN ;
			' xCOT
		;
		HandleMenuItem_EvalObject
	;
	BINT26
	BINT1
	StoUserKeypatch_
	
	
	(	------------------------------------------------------- )
	(	54.2	ATAN
	(
	(	Tap Key:	ATAN
	( Hold Key: ACOT
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		::		
			KEYMAN_CheckLongHold
			:: ' xATAN ;
			' xACOT
		;
		HandleMenuItem_EvalObject
	;
	BINT26
	BINT2
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	72.2	LS-7
	(
	(	RPLMU Solve Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mSolve
		DoCustomMenu1
	;
	BINT33
	BINT2
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	72.3 	RS-7
	(	72.31 RSH-7
	(
	(	RPLMNU Equation Library Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mEqLib
		DoCustomMenu1
	;
	BINT33
	2DUP
	BINT3
	StoUserKeypatch_
	BINT9
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	73.2	LS-8
	(
	(	RPLMNU Exponentials & Logs Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mExpLn
		DoCustomMenu1
	;
	BINT34
	BINT2
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	73.3	RS-8
	(
	(	Coda Trigonometry Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mTrig
		DoCustomMenu1
	;
	BINT34
	BINT3
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	74.2	LS-9
	(
	(	Coda Finance Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mFinance
		DoCustomMenu1
	;
	BINT35
	BINT2
	StoUserKeypatch_

	
	(	------------------------------------------------------- )
	(	74.3	RS-9
	(
	(	TIMEMAN Calendar / Clock
	(	------------------------------------------------------- )
	'
	::
		TIMEMAN_Dset
	;
	BINT35
	BINT3
	StoUserKeypatch_
	
	
	(	------------------------------------------------------- )
	(	74.3	RSH-9
	(
	(	Coda Time & Alarm Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mTime
		DoCustomMenu1
	;
	BINT35
	BINT9
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	82.2	LS-4
	(
	(	Coda Calculus Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mCalculus
		DoCustomMenu1
	;
	BINT38
	BINT2
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	82.3	RS-4
	(
	(	Coda Algebra Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mAlgebra
		DoCustomMenu1
	;
	BINT38
	BINT3
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	83.2	LS-5
	(
	(	Coda Matrices Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mMatrices
		DoCustomMenu1
	;
	BINT39
	BINT2
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	83.3	RS-5
	(
	(	Coda Statistics Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mStat
		DoCustomMenu1
	;
	BINT39
	BINT3
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	84.2	LS-6
	(
	(	Coda Unit Conversion Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mUnitConvert
		DoCustomMenu1
	;
	BINT40
	BINT2
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	84.21	LSH-6
	(
	(	Coda Physical Constants Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mConstants
		DoCustomMenu1
	;
	BINT40
	BINT8
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	84.31	RSH-6
	(
	(	UNITMAN Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		% 359
		InitMenu%
	;
	BINT40
	BINT9
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	92.2 LS-1
	(
	(	Coda Real Numbers Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mArith
		DoCustomMenu1
	;
	BINT43
	BINT2
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	92.3	RS-1
	(
	(	Coda Complex Numbers Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mComplex
		DoCustomMenu1
	;
	BINT43
	BINT3
	StoUserKeypatch_


	(	------------------------------------------------------- )
	(	94.21	LSH-3
	(
	(	Base Mode Toggle (Down)
	(	Hexadecimal -> Decimal -> Octal -> Binary ...
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		CK0NOLASTWD
		BINT11
		DUP
		SysITE
		::
			ClrSysFlag
			BINT12
			DUP
			SysITE
			ClrSysFlag
			SetSysFlag
		;
		SetSysFlag
	;
	BINT45
	BINT8
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	94.3	RS-3
	(
	(	Coda Number Base Menu
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		mBase
		DoCustomMenu1
	;
	BINT45
	BINT3
	StoUserKeypatch_
	
	
	(	------------------------------------------------------- )
	(	94.31	RSH-3
	(
	(	Base Mode Toggle (Up)
	(	Binary -> Octal -> Decimal -> Hexadecimal -> ...
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		CK0NOLASTWD
		BINT11
		DUP
		SysITE
		ClrSysFlag
		::
			SetSysFlag
			BINT12
			DUP
			SysITE
			ClrSysFlag
			SetSysFlag
		;
	;
	BINT45
	BINT9
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	101.3	RS-On
	(
	(	Turn Calculator Off with Garbage Collection
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		GARBAGE
*		DeleteGarbageAlarm
		TurnOff
*		CreateGarbageAlarm
	;
	BINT47
	BINT3
	StoUserKeypatch_

  	
	
	(	------------------------------------------------------- )
	(	103.31	RSH-.
	(	103.61	Alpha-RSH-.
	(
	( Insert Newline & Automatically Indent
	( Emacs NL&IND Command if installed
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		1790    							( Check to make sure Emacs is installed. )
		ONSRRP?_
		ITE
		EMACS_NL&IND					( Start Emacs NL&IND )
		::
			BINT49
			BINT3
			Key>StdKeyOb
			DoKeyOb
		;
	;
	BINT49
	2DUP
	BINT9
	StoUserKeypatch_
	BINT12
	StoUserKeypatch_


  (	------------------------------------------------------- )
	(	105.31	RSH-Enter
	(
	(	Exact / Approximate Mode Toggle
	(	------------------------------------------------------- )
	'
	::
		TakeOver
		CK0NOLASTWD
		BINT105
		SysITE
		::
			{ %-2 %-3 % -105. }
			xCF
		;
		::
			{ %-2 %-3 % -105. }
			xSF
		;
	;
	BINT51
	BINT9
	StoUserKeypatch_
	
	
	( Soft Reset the Calculator for changes to take effect )
	xONC	
;
