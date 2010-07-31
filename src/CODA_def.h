* This Definition file has been automaticaly
* generated from the C:\Documents and Settings\Ryan\Desktop\codagit\src\Coda.hpp project files
* including:
*    Handlers.s
*    HandlersMenu.s
*    Menu.s
*    MenuApps.s
*    MenuArith.s
*    MenuBase.s
*    MenuCmplx.s
*    MenuConst.s
*    MenuExpLn.s
*    MenuFinance.s
*    MenuModes.s
*    MenuPrg.s
*    MenuSymbolic.s
*    MenuTime.s
*    MenuTool.s
*    MenuTrig.s
*    MenuUnits.s
*    Math.s
*    Trig.s
*    Elex.s
*    Time.s
*    Misc.s
*    Tools.s
*    AsnKeys.s

ASSEMBLE
=~xMENU2 EQU  #0005FD
=~x\25D EQU  #0015FD
=~xREV EQU  #0025FD
=~xRND\90 EQU  #0035FD
=~xRND\8F EQU  #0045FD
=~xRND\90\8F EQU  #0055FD
=~xCSC EQU  #0065FD
=~xSEC EQU  #0075FD
=~xCOT EQU  #0085FD
=~xACSC EQU  #0095FD
=~xASEC EQU  #00A5FD
=~xACOT EQU  #00B5FD
=~xCSCH EQU  #00C5FD
=~xSECH EQU  #00D5FD
=~xCOTH EQU  #00E5FD
=~xACSCH EQU  #00F5FD
=~xASECH EQU  #0105FD
=~xACOTH EQU  #0115FD
=~xPRESX EQU  #0125FD
=~xR12 EQU  #0135FD
=~xR24 EQU  #0145FD
=~xR48 EQU  #0155FD
=~xR96 EQU  #0165FD
=~xLPYR\3F EQU  #0175FD
=~xWKDAY EQU  #0185FD
=~xFILER6 EQU  #0195FD
=~xBZ2 EQU  #01A5FD
=~xTNT2 EQU  #01B5FD
=~xLZD EQU  #01C5FD
=~x\8DTOFF EQU  #01D5FD
=~xTOFF\8D EQU  #01E5FD
=~xHdrMsg EQU  #01F5FD
=~xMEM1 EQU  #0205FD
=~xMEM2 EQU  #0215FD
=~xDSort EQU  #0225FD
=~xDefrag EQU  #0235FD
=~xKeyDec EQU  #0245FD
=~xKeyObj EQU  #0255FD
=~xONC EQU  #0265FD
=~xONF EQU  #0275FD
=~xAsnKeys EQU  #0285FD
=~HandleStartup EQU  #0295FD
=~HandleShutdown EQU  #02A5FD
=~HandleEditorStart EQU  #02B5FD
=~HandleEditorExit EQU  #02C5FD
=~HandleError EQU  #02D5FD
=~HandleExtProg EQU  #02E5FD
=~HandleMenuItem EQU  #02F5FD
=~HandleMenuItem_CustomHelp EQU  #0305FD
=~HandleMenuItem_NoHelp EQU  #0315FD
=~HandleMenuItem_EvalObject EQU  #0325FD
=~DoCustomMenu1 EQU  #0335FD
=~DoCustomMenu2 EQU  #0345FD
=~MenuApps EQU  #0355FD
=~MenuAppsElex EQU  #0365FD
=~MenuArith EQU  #0375FD
=~MenuBase EQU  #0385FD
=~MenuBaseLogic EQU  #0395FD
=~MenuBaseBit EQU  #03A5FD
=~MenuBaseByte EQU  #03B5FD
=~MenuBase_DoTickMark EQU  #03C5FD
=~MenuCmplx EQU  #03D5FD
=~MenuConst_HandleMenuItem EQU  #03E5FD
=~MenuConst EQU  #03F5FD
=~MenuExpLn EQU  #0405FD
=~MenuFinance EQU  #0415FD
=~MenuMode EQU  #0425FD
=~MenuModeFormat EQU  #0435FD
=~MenuModeAngle EQU  #0445FD
=~MenuModeCoord EQU  #0455FD
=~MenuModeCAS EQU  #0465FD
=~MenuModeMenu EQU  #0475FD
=~MenuModeRPLMNU EQU  #0485FD
=~MenuPrg EQU  #0495FD
=~MenuPrgStack EQU  #04A5FD
=~MenuPrgStackDup EQU  #04B5FD
=~MenuPrgStackDrop EQU  #04C5FD
=~MenuPrgStackPick EQU  #04D5FD
=~MenuPrgStackRoll EQU  #04E5FD
=~MenuPrgMem EQU  #04F5FD
=~MenuPrgMemObj EQU  #0505FD
=~MenuPrgDev EQU  #0515FD
=~MenuSymbolic EQU  #0525FD
=~MenuTime EQU  #0535FD
=~MenuTimeClock EQU  #0545FD
=~MenuTimeAlarms EQU  #0555FD
=~MenuTool EQU  #0565FD
=~MenuTrig EQU  #0575FD
=~MenuTrigHyp EQU  #0585FD
=~MenuTrigTransform EQU  #0595FD
=~MenuUnits EQU  #05A5FD
=~GROB_UpArrow EQU  #05B5FD
=~MakeSpecialLabel EQU  #05C5FD
=~MakeRoundedLabel EQU  #05D5FD
=~MakeBracketLabel EQU  #05E5FD
=~CONFIG EQU  #05F5FD
=~CreateGarbageAlarm EQU  #0605FD
=~DeleteGarbageAlarm EQU  #0615FD

RPL
EXTERNAL xMENU2
EXTERNAL x\25D
EXTERNAL xREV
EXTERNAL xRND\90
EXTERNAL xRND\8F
EXTERNAL xRND\90\8F
EXTERNAL xCSC
EXTERNAL xSEC
EXTERNAL xCOT
EXTERNAL xACSC
EXTERNAL xASEC
EXTERNAL xACOT
EXTERNAL xCSCH
EXTERNAL xSECH
EXTERNAL xCOTH
EXTERNAL xACSCH
EXTERNAL xASECH
EXTERNAL xACOTH
EXTERNAL xPRESX
EXTERNAL xR12
EXTERNAL xR24
EXTERNAL xR48
EXTERNAL xR96
EXTERNAL xLPYR\3F
EXTERNAL xWKDAY
EXTERNAL xFILER6
EXTERNAL xBZ2
EXTERNAL xTNT2
EXTERNAL xLZD
EXTERNAL x\8DTOFF
EXTERNAL xTOFF\8D
EXTERNAL xHdrMsg
EXTERNAL xMEM1
EXTERNAL xMEM2
EXTERNAL xDSort
EXTERNAL xDefrag
EXTERNAL xKeyDec
EXTERNAL xKeyObj
EXTERNAL xONC
EXTERNAL xONF
EXTERNAL xAsnKeys
EXTERNAL HandleStartup
EXTERNAL HandleShutdown
EXTERNAL HandleEditorStart
EXTERNAL HandleEditorExit
EXTERNAL HandleError
EXTERNAL HandleExtProg
EXTERNAL HandleMenuItem
EXTERNAL HandleMenuItem_CustomHelp
EXTERNAL HandleMenuItem_NoHelp
EXTERNAL HandleMenuItem_EvalObject
EXTERNAL DoCustomMenu1
EXTERNAL DoCustomMenu2
EXTERNAL MenuApps
EXTERNAL MenuAppsElex
EXTERNAL MenuArith
EXTERNAL MenuBase
EXTERNAL MenuBaseLogic
EXTERNAL MenuBaseBit
EXTERNAL MenuBaseByte
EXTERNAL MenuBase_DoTickMark
EXTERNAL MenuCmplx
EXTERNAL MenuConst_HandleMenuItem
EXTERNAL MenuConst
EXTERNAL MenuExpLn
EXTERNAL MenuFinance
EXTERNAL MenuMode
EXTERNAL MenuModeFormat
EXTERNAL MenuModeAngle
EXTERNAL MenuModeCoord
EXTERNAL MenuModeCAS
EXTERNAL MenuModeMenu
EXTERNAL MenuModeRPLMNU
EXTERNAL MenuPrg
EXTERNAL MenuPrgStack
EXTERNAL MenuPrgStackDup
EXTERNAL MenuPrgStackDrop
EXTERNAL MenuPrgStackPick
EXTERNAL MenuPrgStackRoll
EXTERNAL MenuPrgMem
EXTERNAL MenuPrgMemObj
EXTERNAL MenuPrgDev
EXTERNAL MenuSymbolic
EXTERNAL MenuTime
EXTERNAL MenuTimeClock
EXTERNAL MenuTimeAlarms
EXTERNAL MenuTool
EXTERNAL MenuTrig
EXTERNAL MenuTrigHyp
EXTERNAL MenuTrigTransform
EXTERNAL MenuUnits
EXTERNAL GROB_UpArrow
EXTERNAL MakeSpecialLabel
EXTERNAL MakeRoundedLabel
EXTERNAL MakeBracketLabel
EXTERNAL CONFIG
EXTERNAL CreateGarbageAlarm
EXTERNAL DeleteGarbageAlarm

