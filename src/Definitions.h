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
																
DEFINE	constCodaVersion		"CodaHP Interface Enhancement\0ABuild: July 31, 2010\0ACopyright Ryan Edwards 2008-2010"

( Settings Flags Defintions )
DEFINE	flagVectoredEnter		BINT63

( Menu Number Definitions )
DEFINE	mAlgebra						BINT1
DEFINE	mBase								BINT2
DEFINE	mBaseBit						BINT3
DEFINE	mBaseByte						BINT4
DEFINE	mBaseLogic					BINT5
DEFINE	mCalculus						BINT6
DEFINE	mComplex						BINT7
DEFINE	mConstants					BINT8
DEFINE	mEqLib							BINT9
DEFINE	mExpLn							BINT10
DEFINE	mMath								BINT11
DEFINE	mMatrices						BINT12
DEFINE	mMode								BINT13
DEFINE	mModeFormat					BINT14
DEFINE	mPrg								BINT15
DEFINE	mPrgChar						BINT16
DEFINE	mPrgDev							BINT17
DEFINE	mPrgMem							BINT18
DEFINE	mPrgMemDir					BINT19
DEFINE	mPrgMemMath					BINT20
DEFINE	mPrgMemObj					BINT21
DEFINE	mPrgMemPort					BINT22
DEFINE	mPrgStack						BINT23
DEFINE	mPrgStackDup				BINT24
DEFINE	mPrgStackDrop				BINT25
DEFINE	mPrgStackPick				BINT26
DEFINE	mPrgStackRoll				BINT27
DEFINE	mArith							BINT28
DEFINE	mSolve							BINT29
DEFINE	mStat								BINT30
DEFINE	mSymbolic						BINT31
DEFINE	mTime								BINT32
DEFINE 	mTool								BINT33
DEFINE	mTrig								BINT34
DEFINE	mTrigHyp						BINT35
DEFINE	mTrigTransform			BINT36
DEFINE	mUnitConvert				BINT37
DEFINE	mModeRPLMNU					BINT38
DEFINE	mModeAngle					BINT39
DEFINE	mModeCAS						BINT40
DEFINE	mModeMenu						BINT41
DEFINE	mModeKey						BINT42
DEFINE	mModeFlag						BINT43
DEFINE	mModeFont						BINT44
DEFINE	mModeDisplay				BINT45
DEFINE	mModeCoord					BINT46
DEFINE	mApps								BINT47
DEFINE	mAppsElex						BINT48
DEFINE	mFinance						BINT49
DEFINE	mTimeClock          BINT50
DEFINE	mTimeAlarms					BINT51


( Menu Page Number Definitions )
DEFINE	mPage1							BINT1
DEFINE	mPage2							BINT2
DEFINE	mPage3							BINT3
DEFINE	mPage4							BINT4
DEFINE	mPage5							BINT5
DEFINE	mPage6							BINT6
DEFINE	mPage7							BINT7
DEFINE	mPage8							BINT8
DEFINE	mPage9							BINT9
DEFINE	mPage10							BINT10


( UserRPL Commands )
EXTERNAL x>S2								( ->S2 )
EXTERNAL x\->KEYTIME        ( ->KEYTIME )
EXTERNAL xAMORT
EXTERNAL xASM2
EXTERNAL xCASCFG
EXTERNAL xCASCMD
EXTERNAL xCONLIB
EXTERNAL xCONST
EXTERNAL xCYLIN
EXTERNAL xDISTRIB
EXTERNAL xEXP2POW
EXTERNAL xEXPAND
EXTERNAL xEXPLN
EXTERNAL xFACTOR
EXTERNAL xFDISTRIB
EXTERNAL xGCD
EXTERNAL xHALFTAN
EXTERNAL xHELP
EXTERNAL xKEYEVAL
EXTERNAL xLCM
EXTERNAL xLIN
EXTERNAL xLNCOLLECT
EXTERNAL xMODSTO
EXTERNAL xPOWEXPAND
EXTERNAL xPROPFRAC
EXTERNAL xRCLVX
EXTERNAL xRECT
EXTERNAL xRENAME
EXTERNAL xREORDER
EXTERNAL xSIMPLIFY
EXTERNAL xSERIAL
EXTERNAL xSORT
EXTERNAL xSPHERE
EXTERNAL xSTOVX
EXTERNAL xSUBST
EXTERNAL xTAN2CS2
EXTERNAL xTAN2SC
EXTERNAL xTAN2SC2
EXTERNAL xTEXPAND
EXTERNAL xTRIG
EXTERNAL xTRIGCOS
EXTERNAL xTRIGSIN
EXTERNAL xTRIGTAN
EXTERNAL xTSIMP
EXTERNAL xTVM
EXTERNAL xTVMBEG
EXTERNAL xTVMEND
EXTERNAL xTVMROOT
EXTERNAL xVER
EXTERNAL xVERSION
EXTERNAL xXQ

( Internal HP Solver Applications )
FEXTERNAL HPSolver_Equation
FEXTERNAL HPSolver_DiffEquation
FEXTERNAL HPSolver_Polynomial	
FEXTERNAL HPSolver_LinSystem
FEXTERNAL HPSolver_Finance
FEXTERNAL HPStats_SingleVariable
FEXTERNAL HPStats_Frequencies
FEXTERNAL HPStats_FitData
FEXTERNAL HPStats_SummaryStats
FEXTERNAL HPStats_HypothesisTests
FEXTERNAL HPStats_ConfIntervals
FEXTERNAL HPTime_SetTimeAndDate
FEXTERNAL HPTime_SetAlarm
FEXTERNAL HPTime_BrowseAlarms

( SysRPL Commands )
EXTERNAL %TICKSsec_
EXTERNAL grobAlertIcon
EXTERNAL MsgBoxMenu
FEXTERNAL POPFLAGS_
FEXTERNAL PUSHFLAGS_
FEXTERNAL Z>R

( 3rd-Party Library Commands )
EXTERNAL EMACS_DYNCPL
EXTERNAL EMACS_EDOB
EXTERNAL EMACS_NL&IND
EXTERNAL EMACS_RPLCPL
EXTERNAL EMACS_RPLED
EXTERNAL EMACS_SDIAG

EXTERNAL HEADMAN_ViewP

EXTERNAL TIMEMAN_Dset

EXTERNAL KEYMAN_CheckDoubleTap
EXTERNAL KEYMAN_CheckLongHold
EXTERNAL KEYMAN_K&SA
EXTERNAL KEYMAN_More
EXTERNAL KEYMAN_RclK

EXTERNAL SDIAG_UsrDiag


( Definitions )
( The memory location are derived from: ROMPTR [0]DE 32 becomes EQU # 320DE )
ASSEMBLE
=~x>S2											EQU		#20100
=~xASM2											EQU		#02101
=~xDISTRIB									EQU		#190DE
=~xEXP2POW									EQU		#1A0DE
=~xEXPLN										EQU		#17314
=~xFDISTRIB									EQU		#180DE
=~xHELP											EQU		#320DE
=~xLIN											EQU		#14314
=~xLNCOLLECT								EQU		#16314
=~xPOWEXPAND 								EQU		#1B0DE
=~xSERIAL										EQU		#1D100
=~xTEXPAND									EQU		#13314
=~xTSIMP										EQU		#15314

=^HPSolver_Equation					EQU		#32002
=^HPSolver_DiffEquation			EQU		#33002
=^HPSolver_Polynomial				EQU		#34002
=^HPSolver_LinSystem				EQU		#35002
=^HPSolver_Finance					EQU		#36002
=^HPStats_SingleVariable		EQU		#38002
=^HPStats_Frequencies				EQU		#39002
=^HPStats_FitData						EQU		#3A002
=^HPStats_SummaryStats			EQU		#3B002
=^HPStats_HypothesisTests		EQU		#05003
=^HPStats_ConfIntervals			EQU		#06003
=^HPTime_SetTimeAndDate			EQU		#46002
=^HPTime_SetAlarm           EQU   #45002
=^HPTime_BrowseAlarms				EQU   #44002

=~EMACS_DYNCPL							EQU		#016FE
=~EMACS_EDOB								EQU		#076FE
=~EMACS_NL&IND							EQU		#0C6FE
=~EMACS_RPLCPL							EQU		#006FE
=~EMACS_RPLED								EQU		#046FE
=~EMACS_SDIAG								EQU		#0B6FE

=~HEADMAN_ViewP							EQU		#00151

=~TIMEMAN_Dset							EQU		#00190

=~KEYMAN_CheckDoubleTap			EQU		#0C4B0
=~KEYMAN_CheckLongHold			EQU		#084B0
=~KEYMAN_K&SA								EQU		#064B0
=~KEYMAN_More								EQU		#074B0
=~KEYMAN_RclK								EQU		#054B0

=~SDIAG_UsrDiag							EQU		#006FD
RPL
