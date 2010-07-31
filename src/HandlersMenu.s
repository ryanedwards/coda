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


( HandleMenuItem: Handles selection of a menu item. A normal keypress
	executes the command defined next in the stream. A long hold
	keypress converts the next command in the stream into a string
	object and attempts to loads the command's help text using SDiag. )
NULLNAME HandleMenuItem
::
	'R
	KEYMAN_CheckLongHold
		HandleMenuItem_EvalObject
	
	( Long-hold: Convert the name of the function to a string
		and send to SDIAG for help lookup. )
	DO>STR
	SDIAG_UsrDiag
;


( HandleMenuItem_CustomHelp: Same as HandleMenuItem, but accepts a
	string object as the second argument, which is passed to the SDIAG
	UsrDiag command for lookup. The string object should be the name
	of an object in its database that does not match the actual name of
	the command.
	Useful if the command name does not match the name in the SDIAG
	database. )
NULLNAME HandleMenuItem_CustomHelp
::
	'R'R
	KEYMAN_CheckLongHold
	::
		DROP
		HandleMenuItem_EvalObject
	;
	
	( Long-hold: Get the string supplied and send to SDIAG for help lookup. )
	SWAPDROP
	SDIAG_UsrDiag
;


( HandleMenuItem_NoHelp: Same as HandleMenuItem, but used when there
	is no help command to display. Displays an error stating there is no
	help available for the command. )
NULLNAME HandleMenuItem_NoHelp
::
	'R
	KEYMAN_CheckLongHold
		HandleMenuItem_EvalObject
	
	( Long-Hold: Display an error. )
	DO>STR
	" Error:\0ANo Command Description"
	&$
	DO$EXIT
;


( HandleMenuItem_NormalTap: Handles the proper execution of the
	object from the runstream. Performs the right thing if at the stack,
	on the editline, or in program mode. )
NULLNAME HandleMenuItem_EvalObject
::
	PrgmEntry?
	EditLExists?
	OR
	case
		DoKeyOb
	EVAL
	AtUserStack	
;
