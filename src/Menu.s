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


( MENU2: Display one of the Coda menus given a menu number in standard
	user m.pg real number format. )
xNAME MENU2
::
	CK1&Dispatch
	real
  ::
		%100
    %*
    COERCE
    BINT100
    #/
    SWAP
    DoCustomMenu2
  ;
;


( DoCustomMenu1: Displays a Coda menu given a menu number as a BINT.
	Will always show the menu on page 1. )
NULLNAME DoCustomMenu1
::
	mPage1
	DoCustomMenu2
;


( DoCustomMenu2: Displays a Coda menu given two BINTs. Allows another
	page besides the first to be displayed.
	Level 2 = Menu ID, Level 1 = Page ID )
NULLNAME DoCustomMenu2
::
	( Multiply page number to get proper page number 1,7,13,etc. )
  DUP#0<>
  IT
  	#1-
  #6*
  #1+
  SWAP
  

  ( MENU: Algebra )
  mAlgebra
  OVER#=
  casedrop
  ::
  	DROP
  	% -82.3
  	xKEYEVAL
  	SysDisplay
  ;
  
  ( MENU: Apps )
  mApps
  OVER#=
  casedrop
  ::
  	MenuApps
    SWAP
    StartMenu
  ;
  
  ( MENU: Apps/Elex )
  mAppsElex
  OVER#=
  casedrop
  ::
  	MenuAppsElex
    SWAP
    StartMenu
  ;
  
  ( MENU: Arith )
  mArith
  OVER#=
  casedrop
  ::
  	MenuArith
    SWAP
    StartMenu
  ;

  ( MENU: Base )
  mBase
  OVER#=
  casedrop
  ::
  	MenuBase
    SWAP
    StartMenu
  ;
  
  ( MENU: Base/Logic )
  mBaseLogic
  OVER#=
  casedrop
  ::
  	MenuBaseLogic
    SWAP
    StartMenu
  ;

  ( MENU: Base/Bit )
  mBaseBit
  OVER#=
  casedrop
  ::
  	MenuBaseBit
    SWAP
    StartMenu
  ;

  ( MENU: Base/Byte )
  mBaseByte
  OVER#=
  casedrop
  ::
  	MenuBaseByte
    SWAP
    StartMenu
  ;
  
  ( MENU: Calculus )
  mCalculus
  OVER#=
  casedrop
  ::
  	DROP
  	% -82.2
  	xKEYEVAL
  	SysDisplay
  ;
  
  ( MENU: Complex Numbers )
  mComplex
  OVER#=
  casedrop
  ::
  	MenuCmplx
  	SWAP
  	StartMenu
  ;
  
  ( MENU: Constants )
  mConstants
  OVER#=
  casedrop
  ::
  	MenuConst
    SWAP
    StartMenu
  ;
  
  ( MENU: Equation Library )
  mEqLib
  OVER#=
  casedrop
  ::
  	DROP
  	% -72.31
  	xKEYEVAL
  	SysDisplay
  ;
  
  ( MENU: Exponents & Logs )
  mExpLn
  OVER#=
  casedrop
  ::
  	MenuExpLn
  	SWAP
  	StartMenu
  ;
  
  ( MENU: Finance )
  mFinance
  OVER#=
  casedrop
  ::
  	MenuFinance
  	SWAP
  	StartMenu
  ;
  
  ( MENU: Math )
  mMath
  OVER#=
  casedrop
  ::
  	DROP
  	% -44.2
  	xKEYEVAL
  	SysDisplay
  ;
  
  ( MENU: Matrices )
  mMatrices
  OVER#=
  casedrop
  ::
  	DROP
  	% -83.2
  	xKEYEVAL
  	SysDisplay
  ;
  
  ( MENU: Mode )
  mMode
  OVER#=
  casedrop
  ::
  	MenuMode
    SWAP
    StartMenu
  ;
  
  ( MENU: Mode/Angle )
  mModeAngle
  OVER#=
  casedrop
  ::
  	MenuModeAngle
    SWAP
    StartMenu
  ;
  
  ( MENU: Mode/Coord )
  mModeCoord
  OVER#=
  casedrop
  ::
  	MenuModeCoord
    SWAP
    StartMenu
  ;
  
  ( MENU: Mode/CAS )
  mModeCAS
  OVER#=
  casedrop
  ::
  	MenuModeCAS
    SWAP
    StartMenu
  ;
  
  ( MENU: Mode/Format )
  mModeFormat
  OVER#=
  casedrop
  ::
  	MenuModeFormat
    SWAP
    StartMenu
  ;
  
  ( MENU: Mode/Menu )
  mModeMenu
  OVER#=
  casedrop
  ::
  	MenuModeMenu
    SWAP
    StartMenu
  ;
  
  ( MENU: Mode/RPLMNU )
  mModeRPLMNU
  OVER#=
  casedrop
  ::
  	MenuModeRPLMNU
    SWAP
    StartMenu
  ;
  
  ( MENU: Programming )
  mPrg
  OVER#=
  casedrop
  ::
  	( MenuPrg
    SWAP
    StartMenu )
		DROP
  	% -42.2
  	xKEYEVAL
  	SysDisplay
  ;

  ( MENU: Programming/Char )
  mPrgChar
  OVER#=
  casedrop
  ::
  	DROP
  	% -42.31
  	xKEYEVAL
  	SysDisplay
  ;
  
  ( MENU: Programming/Development )
  mPrgDev
  OVER#=
  casedrop
  ::
  	MenuPrgDev
    SWAP
    StartMenu
  ;

  ( MENU: Programming/Memory )
  mPrgMem
  OVER#=
  casedrop
  ::
  	MenuPrgMem
    SWAP
    StartMenu
  ;

  ( MENU: Programming/Memory/Objects )
  mPrgMemObj
  OVER#=
  casedrop
  ::
  	MenuPrgMemObj
    SWAP
    StartMenu
  ;

  ( MENU: Programming/Stack )
  mPrgStack
  OVER#=
  casedrop
  ::
  	MenuPrgStack
    SWAP
    StartMenu
  ;

  ( MENU: Programming/Stack/Dup )
  mPrgStackDup
  OVER#=
  casedrop
  ::
  	MenuPrgStackDup
    SWAP
    StartMenu
  ;

  ( MENU: Programming/Stack/Drop )
  mPrgStackDrop
  OVER#=
  casedrop
  ::
  	MenuPrgStackDrop
    SWAP
    StartMenu
  ;

  ( MENU: Programming/Stack/Pick )
  mPrgStackPick
  OVER#=
  casedrop
  ::
  	MenuPrgStackPick
    SWAP
    StartMenu
  ;

  ( MENU: Programming/Stack/Roll )
  mPrgStackRoll
  OVER#=
  casedrop
  ::
  	MenuPrgStackRoll
    SWAP
    StartMenu
  ;
  
  ( MENU: Solve )
  mSolve
  OVER#=
  casedrop
  ::
  	DROP
  	% -72.2
  	xKEYEVAL
  	SysDisplay
  ;
  
  ( MENU: Statistics )
  mStat
  OVER#=
  casedrop
  ::
  	DROP
  	% -83.3
  	xKEYEVAL
  	SysDisplay
  ;
  
  ( MENU: Symbolic )
  mSymbolic
  OVER#=
  casedrop
  ::
  	MenuSymbolic
    SWAP
    StartMenu
  ;
  
  ( MENU: Time )
  mTime
  OVER#=
  casedrop
  ::
  	MenuTime
    SWAP
    StartMenu
  ;
  
  ( MENU: Time/Alarms )
  mTimeAlarms
  OVER#=
  casedrop
  ::
  	MenuTimeAlarms
    SWAP
    StartMenu
  ;
  
  ( MENU: Time/Clock )
  mTimeClock
  OVER#=
  casedrop
  ::
  	MenuTimeClock
    SWAP
    StartMenu
  ;
  
  ( MENU: Tool )
  mTool
  OVER#=
  casedrop
  ::
  	EditLExists?
    case
    ::
      EditMenu
      SWAP
      StartMenu
    ;

    MenuTool
    SWAP
    StartMenu
  ;
  
  ( MENU: Trigonometry )
  mTrig
  OVER#=
  casedrop
  ::
  	MenuTrig
    SWAP
    StartMenu
  ;
  
  ( MENU: Trigonometry/Hyp )
  mTrigHyp
  OVER#=
  casedrop
  ::
  	MenuTrigHyp
    SWAP
    StartMenu
  ;
  
  ( MENU: Trigonometry/Transforms )
  mTrigTransform
  OVER#=
  casedrop
  ::
  	MenuTrigTransform
    SWAP
    StartMenu
  ;

  ( MENU: Unit Convert )
  mUnitConvert
  OVER#=
  casedrop
  ::
  	DROP
  	% -84.2
  	xKEYEVAL
  	SysDisplay
  ;
  
  ( ERROR: Menu was not found. )
  SETSIZEERR
;
