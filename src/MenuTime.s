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

NULLNAME MenuTime
{
	{
		::
			TakeOver
			"Clock"
			MakeDirLabel
		;
		::
			TakeOver
			mTimeClock
			DoCustomMenu1
		;
	}
	
	{
		::
			TakeOver
			"Alarm"
			MakeDirLabel
		;
		::
			TakeOver
			mTimeAlarms
			DoCustomMenu1
		;
	}
	
	{
		"HMS\8D" ( HMS-> )
		::
			TakeOver
			HandleMenuItem
			xHMS>
		;
	}
	
	{
		"\8DHMS" ( ->HMS )
		::
			TakeOver
			HandleMenuItem
			x>HMS
		;
	}
	
	{
		"HMS+"
		::
			TakeOver
			HandleMenuItem
			xHMS+
		;
	}
	
	{
		"HMS-"
		::
			TakeOver
			HandleMenuItem
			xHMS-
		;
	}
	
	{
		"Date+"
		::
			TakeOver
			HandleMenuItem
			xDATE+
		;
	}
	
	{
		"\9BDays" ( Delta Days )
		::
			TakeOver
			HandleMenuItem
			xDDAYS
		;
	}
	
	{
		::
			TakeOver
			"LPYR\3F" ( LPYR? )	
			MakeSpecialLabel
		;
		::
			TakeOver
			HandleMenuItem_NoHelp
			xLPYR\3F
		;
	}
	
	{
		::
			TakeOver
			"WkDay"	
			MakeSpecialLabel
		;
		::
			TakeOver
			HandleMenuItem_NoHelp
			xWKDAY
		;
	}
}


NULLNAME MenuTimeClock
{
  {
		"Set"
		::
			TakeOver
			HandleMenuItem
			HPTime_SetTimeAndDate
		;
	}
	
	{
		"Date\8D" ( Date-> )
		::
			TakeOver
			HandleMenuItem
			xDATE
		;
	}
	
	{
		"\8DDate" ( ->Date )
		::
			TakeOver
			HandleMenuItem
			xSETDATE
		;
	}
	
	{
		"Time\8D" ( Time-> )
		::
			TakeOver
			HandleMenuItem
			xTIME
		;
	}
	
	{
		"\8DTime" ( ->Time )
		::
			TakeOver
			HandleMenuItem
			xSETTIME
		;
	}
	
	{
		"TStr"
		::
			TakeOver
			HandleMenuItem
			xTSTR
		;
	}
	
	{
		"ClkAdj"
		::
			TakeOver
			HandleMenuItem
			xCLKADJ
		;
	}
	
	{
		"Tick\8D" ( Tick-> )
		::
			TakeOver
			HandleMenuItem
			xTICKS
		;
	}
	
	NullMenuKey
	NullMenuKey
	NullMenuKey
	
	{
		GROB_UpArrow
		::
			TakeOver
			mTime
			mPage1
			DoCustomMenu2
		;
	}
}


NULLNAME MenuTimeAlarms
{
  {
		"New"
		::
			TakeOver
			HandleMenuItem
			HPTime_SetAlarm
		;
	}
	
	{
		"Brwse"
		::
			TakeOver
			HandleMenuItem
			HPTime_BrowseAlarms
		;
	}
	
	{
		"Ack"
		::
			TakeOver
			HandleMenuItem
			xACK
		;
	}
	
	{
		"AckAll"
		::
			TakeOver
			HandleMenuItem
			xACKALL
		;
	}
	
	{
		"Rcl"
		::
			TakeOver
			HandleMenuItem
			xRCLALARM
		;
	}
	
	{
		"Sto"
		::
			TakeOver
			HandleMenuItem
			xSTOALARM
		;
	}
	
	{
		"Find"
		::
			TakeOver
			HandleMenuItem
			xFINDALARM
		;
	}
	
	{
		"Del"
		::
			TakeOver
			HandleMenuItem
			xDELALARM
		;
	}
	
	NullMenuKey
	NullMenuKey
	NullMenuKey
	
	{
		GROB_UpArrow
		::
			TakeOver
			mTime
			mPage1
			DoCustomMenu2
		;
	}
}
