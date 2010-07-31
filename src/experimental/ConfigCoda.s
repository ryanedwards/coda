( Inform Box File )   ( Do not modify this line )
* Inform Box Coda Configuration Source Code  
* Generated on 2:02:00 AM 16/11/2008 by HP InformBox Generator  
* Inform Box Designer is Ryan Edwards  
 
INCLUDE Header.h                    ( Include Standard RPL defs )
INCLUDE Informbox.h                 ( Include Definitions )
INCLUDE Coda.h                      ( Include Project Header )
 
( Field and Label Definitions ) 
  DEFINE Field1              BINT0   
  DEFINE Field2              BINT1   
  DEFINE Label1              BINT0   
  DEFINE Label2              BINT1   
 
( Local Definitions ) 
 
xNAME CodaConfig 
:: 
( Internal Graphical Datas ) 
  ASSEMBLEM 
  STRING { 
    $(5)#902                        % Uncompressed string size 
    $(3)#0                          % Y offset
    $(2)#0                          % Current Field
    $(2)#2                          % Number of labels
    $(2)#2                          % Number of fields
    $(5)#413                        % Offset to fields definition

  % Start of label definitions      
    $1BC02901A00C7601970F0F0F0F0F0F0F0F0F0F0F09   % Label Label1 definition
    $1BC021100A00C7601970F0F0F0F0F0F0F0F0F0F0F09  % Label Label2 definition

  % Start of field definitions    
    $1B702801200880080150CC701800801503400643C1800C70F0F0F0F03 % Field Field1 definition
    $1B70310020180080150CC701800801503400643C1800C70F0F0F0F03 % Field Field2 definition
  }                                 
  !RPL FLASHPTR IsUncompressDataString ( Uncompress the string )
   
  ( Labels graphic, string on the stack ) 
  ASSEMBLEM $(5)DOBINT $(5)CodaConfigMesBase+#0 $(5)BINT2 
  !RPL FLASHPTR IfSetAllLabelsMessages 
   
  ( Help strings, string on the stack ) 
  ASSEMBLEM $(5)DOBINT $(5)CodaConfigMesBase+#2 $(5)BINT2 
  !RPL FLASHPTR IfSetAllHelpStrings 
   
  ( Title string, string on the stack ) 
  ASSEMBLEM $(5)DOBINT $(5)CodaConfigMesBase+#4 
  !RPL FLASHPTR IfSetTitle          
   
  ( Inform Box Message Handler )    
  'DROPFALSE                        ( Inform Box Message Handler )
   
( Field Definitions )             
  ( Field1 definition )             
  'DROPFALSE                        ( Field Message Handler )
  IfFieldTypeCheck                  ( Field Type )
  MINUSONE                          ( Every type possible )
  BINT3                             ( Decomp object )
  MINUSONE                          ( No choose list )
  MINUSONE                          ( No choose decomp )
  FALSE                             ( Reset Value - defaulted )
  FALSE                             ( Initial Value - defaulted )
                                  
  ( Field2 definition )             
  'DROPFALSE                        ( Field Message Handler )
  IfFieldTypeCheck                  ( Field Type )
  MINUSONE                          ( Every type possible )
  BINT2                             ( Decomp object )
  MINUSONE                          ( No choose list )
  MINUSONE                          ( No choose decomp )
  FALSE                             ( Reset Value - defaulted )
  FALSE                             ( Initial Value - defaulted )
                                  
( Group the Field Definitions in a List ) 
  ASSEMBLEM $(5)BINT16              % #8*No fields 
  !RPL {}N                          
   
  FLASHPTR IfMain2                  
   
;                                   ( end of form procedure )
 
(                                 
% Count for the Message Table  
DCCP 5 CodaConfigMesBase 
) 
 
( Messages automatically copied by Inform Generator ) 
( Messages added to the Library's Message Table ) 
*  "Stack Mode" 
*  "Crappy Crap" 
*  "Enable the enhanced stack." 
*  "" 
*  "Coda Configuration" 
 
( Internal Datas: Do not touch! 
l00000000020C001C0001000000120043006F0064006100200043006F006E00660069006700750072006100740069006F006
SE
0002000D000A
0002000D000A
0002000D000A
f002000080018002000010006004600690065006C006400310006004600690065006C0064003100000003000000050042004
S9004E005400330002000D000A0003004F004E004500000000001A0045006E00610062006C006500200074006800650020006
S5006E00680061006E00630065006400200073007400610063006B002E
f004000080018002000010006004600690065006C006400320006004600690065006C0064003200000003000000050042004
S9004E0054003200000003004F004E0045000000000000
l0024002801E4001800010006004C006100620065006C0031000A0053007400610063006B0020004D006F00640065
l0044002801E4001800010006004C006100620065006C0032000B00430072006100700070007900200043007200610070
0002000D000A
0002000D000A
000C005200790061006E00200045006400770061007200640073
000A0043006F006400610043006F006E006600690067
00040046005400460046
)                                 
