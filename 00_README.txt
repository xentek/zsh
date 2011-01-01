** How to make modifications:
   =========================

	By far the best and most robust way to modify these files is to copy the file
	into zshrc_local.d/ and edit it to your needs. (You can delete the unchanged
	parts as long as you preserve valid zsh syntax.)

	Any shell script placed in zshrc_local.d/site-functions will be autoloaded
	automatically as a function having the filename of the shell script. You don't
	have to do anything else.

	Placing files in zshrc_local.d will ensure that your changes are not clobbered
	when you update.

	Any changes or additions to zshenv.d will ALWAYS be processed by the shell, even
	when invoked with /bin/zsh -f

	Any changes to zshrc.d or zshrc_local.d will only be processed when the -f flag
	is omitted.



** Documentation:
   ==============

	An extensive description of the contents of these directories is available here:
	http://tinyurl.com/zsh-osx



** Updates:
   =======

	Updates are available via google-code:
	http://code.google.com/p/zsh-templates-osx/

	Using svn, as described on that page, is probably the easiest way to update.
	
	
###############################################################################


# ZSH-templates-OSX Version: 2.0.0


#    Created by William G. Scott, Wataru Kagawa, Gary Kerbaugh and several other  
#    contributors, 2003 - 2009. Copyright (c) . All rights reserved. The original 
#    completion functions _open, _fink, _hdiutils, _defaults and their dependencies 
#    were written by Motoi Washida and are now included with the official zsh. 
#    The ones here have been augmented (or changed for the worse, depending upon
#    your point of view).

#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
#    USA
#    
#    cf. URL:   http://www.fsf.org/licensing/licenses/gpl.html                 
#                                                                              
##############################################################################