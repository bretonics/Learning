#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: widget.rb
#
#####################

require 'tk'

root = TkRoot.new() {title "Multiple Widgets"}

#Button
button = TkButton.new(root) {text "Button Caption"}
button.pack("side" => "right", "fill" => "y")

#Entry field
entry = TkEntry.new(root).pack("side"=>"top", "fill"=>"x")  #pack method chained
entry.insert(0, "Text in entry widget")     #text in entry widget

#Label
label =TkLabel.new() {text "Label text"}
label.pack("side"=>"right")

#Text
text = TkText.new(root) {width 20; height 5}.pack("side" => "left")
text.insert('end', "Text field text")

#Message
TkMessage.new(root) {text "Message text"}.pack("side"=>"bottom")    #status bar

Tk.mainloop()