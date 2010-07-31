RPL

INCLUDE CODA.h
INCLUDE	Definitions.h

( NULLNAME ConfigMoon
::
  BINT15
  TestUserFlag

  BINT16
  TestUserFlag

  BINT17
  TestUserFlag

  BINT18
  TestUserFlag

  BINT19
  TestUserFlag

  BINT20
  TestUserFlag

  BINT21
  TestUserFlag

  '
  ID STARTERR

  SAFE@
  DUP
  IT
  SWAPDROP
  {
    LAM FF
    LAM ST
    LAM SV
    LAM EI
    LAM PORT
    LAM RS
    LAM OVAL
    LAM ERR
  }
  BIND

  ; Labels
  "MoonLight ON"
  BINT8
  BINT9
  "RS-232"
  BINT100
  BINT9
  "Improved status area"
  BINT8
  BINT17
  "MK style menus"
  BINT8
  BINT25
  "Oval dirs"
  BINT80
  BINT25
  "Memory monitoring"
  BINT8
  BINT33
  "Errors in status area"
  BINT8
  BINT41

  'DROPFALSE
  BINT0
  BINT8
  BINT6
  BINT9
  BINT32
  MINUSONE
  MINUSONE
  "Program activated?"
  MINUSONE
  MINUSONE
  FALSE
  LAM FF

  'DROPFALSE
  BINT92
  BINT8
  BINT6
  BINT9
  BINT32
  MINUSONE
  MINUSONE
  "Monitor RS-232 port activity?"
  MINUSONE
  MINUSONE
  FALSE
  LAM RS

  'DROPFALSE
  BINT0
  BINT16
  BINT6
  BINT9
  BINT32
  MINUSONE
  MINUSONE
  "Activate improved status area?"
  MINUSONE
  MINUSONE
  TRUE
  LAM ST

  'DROPFALSE
  BINT0
  BINT24
  BINT6
  BINT9
  BINT32
  MINUSONE
  MINUSONE
  "Activate MetaKernel style menus?"
  MINUSONE
  MINUSONE
  TRUE
  LAM SV

  'DROPFALSE
  BINT73
  BINT24
  BINT6
  BINT9
  BINT32
  MINUSONE
  MINUSONE
  "Oval labels?"
  MINUSONE
  MINUSONE
  TRUE
  LAM OVAL

  'DROPFALSE
  BINT0
  BINT32
  BINT6
  BINT9
  BINT32
  MINUSONE
  MINUSONE
  "Activate graphical memory viewer?"
  MINUSONE
  MINUSONE
  TRUE
  LAM EI

  'DROPFALSE
  BINT0
  BINT40
  BINT6
  BINT9
  BINT32
  MINUSONE
  MINUSONE
  "Display errors in header?"
  MINUSONE
  MINUSONE
  TRUE
  LAM ERR

  BINT7
  BINT7
  'DROPFALSE
  "MOONLIGHT FLAGS"
  DoInputForm
  ITE
  ::
    BINT7
    UNROLL
    BINT18
    SWAP
    ITE
    SetUserFlag
    ClrUserFlag
    BINT21
    SWAP
    ITE
    SetUserFlag
    ClrUserFlag
    BINT17
    SWAP
    ITE
    SetUserFlag
    ClrUserFlag
    BINT16
    SWAP
    ITE
    SetUserFlag
    ClrUserFlag
    BINT20
    SWAP
    ITE
    SetUserFlag
    ClrUserFlag
    SWAPDUP
    LAM ERR
    EQUAL
    ITE
    DROP
    ::
      ITE
      ::
        ID x005
        SaveVarRes
        HOMEDIR
        '
        ID STARTERR
        SAFESTO
        RestVarRes
      ;
      ::
        SaveVarRes
        HOMEDIR
        '
        ID STARTERR
        PURGE
        RestVarRes
      ;
    ;
    LAM FF
    EQUAL
    ?SKIP
    ID MOON
  ;
; )


( First attempt at a stack replacement with enhanced header.
	Original code stolen from "Status" http://www.hpcalc.org/details.php?id=3368 )
( NULLNAME STACK
::
  BINT30
  DUP
  UserITE
  ClrUserFlag
  ::
    SetUserFlag
    BEGIN
    AtUserStack
    SysMenuCheck
    DA2aOK?NOTIT
    ?DispStack
    DA1OK?NOTIT
    ::
      KEYINBUFFER?
      NOTcase
      ::
        TOADISP
        DispStsBound
        GARBAGE
        RAD?
        ITE
        "RAD"
        ::
          BINT18
          SysITE
          "GRA"
          "DEG"
        ;
        " "
        &$
        BINT11
        SysITE
        ::
          BINT12
          SysITE
          "HEX"
          "OCT"
        ;
        ::
          BINT12
          SysITE
          "BIN"
          "DEC"
        ;
        " "
        &$
        &$
        BINT49
        SysITE
        ::
          BINT50
          SysITE
          "E"
          "F"
        ;
        ::
          BINT50
          SysITE
          "S"
          " "
        ;
        "  "
        &$
        " "
        &$
        &$
        " "
        &$
        % 105.
        COERCE
        TestSysFlag
        ITE
        "~"
        "="
        " "
        &$
        &$
        ID CASDIR
        ID VX
        x>STR
        DUP
        xSIZE
        %1
        x-
        %2
        SWAP
        xSUB
        DUP
        xSIZE
        COERCE
        %5
        COERCE
        #>
        ITE
        ::
          %1
          %5
          xSUB
        ;
        ::
          DUP
          xSIZE
          %5
          SWAP
          x-
          "      "
          SWAP
          %1
          SWAP
          xSUB
          &$
        ;
        " "
        &$
        &$
        xHOME
        MEM
        #2/
        #>$
        DUP
        xSIZE
        %6
        SWAP
        x-
        "      "
        SWAP
        %1
        SWAP
        xSUB
        SWAP
        &$
        " "
        &$
        &$
        UserKeys?
        ITE
        "U"
        " "
        " "
        &$
        &$
        AlgEntry?
        ITE
        "A"
        " "
        " "
        &$
        &$
        PrgmEntry?
        ITE
        "P"
        " "
        &$
        xPATH
        x>STR
        DUP
        xSIZE
        %2
        x-
        %3
        SWAP
        xSUB
        DUP
        xSIZE
        COERCE
        %15
        COERCE
        #>
        ITE
        ::
          %1
          %15
          xSUB
        ;
        ::
          DUP
          xSIZE
          %15
          SWAP
          x-
          "                "
          SWAP
          %1
          SWAP
          xSUB
          &$
        ;
        xDATE
        xTIME
        xTSTR
        DUP
        xSIZE
        %5
        SWAP
        xSUB
        &$
        BINT14
        # 83
        MAKEGROB
        BINT0
        SWAP
        BINT0
        SWAP
        XYGROBDISP
        $>grob
        SWAP
        $>grob
        BINT0
        SWAP
        BINT1
        SWAP
        XYGROBDISP
        BINT0
        SWAP
        BINT8
        SWAP
        XYGROBDISP
        % 56.
        COERCE
        TestSysFlag
        ITE
        GROB 00016 0000000000000000000000
        GROB 00016 600005000040A0A011F140
        BINT39
        SWAP
        BINT0
        SWAP
        XYGROBDISP
        % 103.
        COERCE
        TestSysFlag
        ITE
        GROB 00014 5000040000E0303030E0
        GROB 00014 500004000070B070B0B0
        BINT47
        SWAP
        BINT1
        SWAP
        XYGROBDISP
        SetDA1Valid
        SetDA1IsStat
      ;
      SetDA1Bad
    ;
    DA2bOK?NOTIT
    DispEditLine
    DA3OK?NOTIT
    ?DispMenu
    ClrDAsOK
    GetKeyOb
    ERRSET
    DoKeyOb
    ERRTRAP
    SysErrorTrap
    BINT30
    TestUserFlag
    NOT
    UNTIL
    'NOP
    KeyOb!
  ;
; )

( Weird way of initializing a library by setting an alarm with a one second delay.
Why would we ever want to do this?
::
  # 4E3
  TOSRRP
  
  DATE
  TOD
  %9600_
  %1/
  %HMS+
  '
  ::
    PURGALARM%
    ID zMODE
  ;
  %0
  STOALM
  DROP
; )
