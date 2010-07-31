RPL

INCLUDE CODA.h
INCLUDE	Definitions.h


NULLNAME VectoredEnterHandler
::
	( Make sure the header is set to 2 high. MUST BE! )
	BINT2
	SetHeader
	
	DROP
	DEPTH
	#0<>
	IT
	::
		PUSHFLAGS_
		DUP
		
		::
			( If the value is a hex string, convert to a real.
				Save a copy for displaying on screen later. )	
			DUPTYPEHSTR?
			case
			::
				DUP		
				HXS>%
				
				VectoredEnterDisplayReals
				ROT
				VectoredEnterDisplayHex
			;	
			
			
			( If the value is a ZINT, convert to a real.
				We also convert it to a binary integer for displaying
				onscreen later. )
			DUPTYPEZINT?
			case
			::
				Z>R
				VectoredEnterDisplayReals
				SWAPDROPDUP
			
				( Convert the integer to a binary integer. )
				DO>STR
				"#"
				!insert$
				"d"
				!append$
				DOSTR>
					
				ROT
				VectoredEnterDisplayHex
			;
			
			
		  ( We have a Real number. )
			DUPTYPEREAL?
			case
			::
			  VectoredEnterDisplayReals
			  SWAP
			  
			  ( Check to see if the number is valid for hex conversion.)
			  DUP
			  %SGN
			  %-1
			  %<>
			  IT
			  ::
			  	DUP
			  	%2
			  	% 64
			  	%^
			  	%1-
			  	%<
			  	IT
			  	::
			  		( Truncate the number and convert to hex. )
					  %0
						TRCXY
						DOHEX
						BINT64
						dostws
						%>#
						
						VectoredEnterDisplayHex
			  	;
			  ;
			;
		;
		
		( Display the data in the header. )
		Rest16Patch_
		SetDA1Temp
		
		POPFLAGS_	
	;	
;


NULLNAME VectoredEnterDisplayReals
::
	( Grab a copy of the status area with the dividing line
		and clear the contents. )
	DispStatus
	Save16Patch_
	BINT0
	BINT0
	BINT131
	BINT13
	GROB!ZERO
	
	( Scientific Display Format. Display the number in
		scientific notation in the top row. The mantissa is
		shown without any extra zeroes. )
	OVER
  %MANTISSA
  DOSTD
  DO>STR
  LEN$
  BINT2
  #-
  DOSCI

  OVER
  DO>STR
  $>grob
	OVER
  BINT0
  BINT1
  GROB!


	( Fixed Decimal Display. The format is not shown if the
		number is too large or too small to be meaningful. If
		the calculator decides to display the number using
		scientific notation, then this isn't shown. )
		
	( Look for the 'E' from scientific notation. )
	OVER	
	DOSTD
	DO>STR
	"E"
	BINT1
	POSCHR
	#0=
	IT
	::
		( If not in scientific notation, find out how many
			decimal places are in the number and set FIX accordingly. )
		OVER
		%FP
		%ABS
		DUP%0=
		ITE
		::
			COERCE
		;
		::
			DO>STR
			LEN$
			#1-
		;
		DOFIX

		( Convert to a grob and add to the status image. )
		OVER
		DecompStd1Line
		$>grob
		OVER
		BINT0
		BINT7
		GROB!
	;
;


NULLNAME VectoredEnterDisplayHex
::
	DecompStd1Line
	
	( Shorten, or nicen up the string. )
	::
		( If the string is very long, it crashes into the left
			hand side number, so we truncate the leading pound sign
			and the trailing 'h' )
		DUPLEN$
		DUP
		BINT18
		#>=_
		casedrop
		::
			BINT3
			OVERLEN$
			#1-
			SUB$
		;
		
		( If the string is almost there, we only cut off the
			leading pound sign. )
		DUP
		BINT17
		#>=_
		casedrop
		::
			BINT3
			LAST$
		;
		
		( When the string gets over 14 characters long we remove
			the space between the pound sign and the number to make
			it look cleaner. )
		DUP
		BINT14
		#>=_
		casedrop
		::
			BINT3
			LAST$
			CHR_#
			>H$
		;	
		
		( Otherwise, if the number is fairly short, we leave it
			just as the calculator would show it. )
		DROP	
	;	
	
	( Convert to a grob and add to the status image in the
		top right corner. )
	$>grob
	2DUP
	GROBDIMw
	132
	SWAP#-
	BINT1
	GROB!
;


( Auto simplification algorithm.
	Based on AutoSimp49 v1.1 by Steen S. Schmidt )
( NULLNAME AutoSimp
::
  DEPTH
  DUPONE
  #>ITE
  ::
    DROPOVER
    TYPESYMB?
    ITE
    ::
      DUPNULL$?
      IT
      ::
        DROP
        GetLastEdit
        DROP
      ;
      DUP
      "EVAL"
      EQUAL
      OVER
      "SIMPLIFY"
      EQUALOR
      OVER
      "DROP"
      EQUALOR
      OVER
      "DUP"
      EQUALOR
      OVER
      "SWAP"
      EQUALOR
      OVER
      "OVER"
      EQUALOR
      OVER
      "NIP"
      EQUALOR
      OVER
      "PICK3"
      EQUALOR
      OVER
      "DUPDUP"
      EQUALOR
      OVER
      "ROT"
      EQUALOR
      OVER
      "ROLL"
      EQUALOR
      OVER
      "UNROT"
      EQUALOR
      OVER
      "ROLLD"
      EQUALOR
      OVER
      "REORDER"
      EQUALOR
      OVER
      "FACTOR"
      EQUALOR
      OVER
      "COLLECT"
      EQUALOR
      OVER
      "PROPFRAC"
      EQUALOR
      OVER
      "EXPAND"
      EQUALOR
      SWAP
      "PARTFRAC"
      EQUALOR
      ?SKIP
      ::
        '
        ID asl
        RclHiddenVar
        IT
        ::
          OVER
          OCRC
          DROPOVER
          SWAP
          EQUALPOSCOMP
          #0=ITE
          ::
            BINT2
            BINT10
            SUBCOMP
            FPTR 7 A2
            FPTR 7 9B
            BINT120
            TestSysFlag
            BINT120
            SetSysFlag
            5ROLL
            FPTR 6 467
            SWAP
            ITE
            ROTROT2DROP
            ::
              SWAP
              ITE
              FPTR 7 95
              FPTR 7 96
              SWAP
              ITE
              FPTR 7 97
              FPTR 7 98
              BINT120
              ClrSysFlag
            ;
            DUPUNROT
            OCRC
            DROP
            >TCOMP
            '
            ID asl
            StoHiddenVar
          ;
          DROP
        ;
      ;
    ;
    DROP
    NULL$
    SaveLastEdit
  ;
  ::
    #0<>
    IT
    DROP
  ;
; )
