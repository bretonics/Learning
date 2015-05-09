#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: tkExample.rb
#
#####################

require 'tk'

root = TkRoot.new {title "First Example"}   #User interface title
TkLabel.new(root) do        #widget, with 'root' object as argument
    text 'A sample GUI using TK'
    pack {padx 15; pady 15; side 'left'}    #compiles for diplay
end
Tk.mainloop         #display user interface