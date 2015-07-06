#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: helloButton.rb
#
#####################


require 'tk'

class HelloWorld

    def initialize
        ph = {'padx' =>50, 'pady' =>30}
        p = proc {hello}        #variable defined that contains procedure when button clicked
        @text = TkVariable.new      #variable holds text typed and displayed
        root = TkRoot.new{title "Hello, name"}
        top = TkFrame.new(root)
        TkLabel.new(top) {text 'Name?'; pack(ph)}   #prompt to enter name
        @entry = TkEntry.new(top, 'textvariable'=>@text)
        @entry.pack(ph)
        TkButton.new(top) {text 'Say Hello'; command p; pack ph}    #associated with command 'p' that will run when clicked
        TkButton.new(top) {text 'Exit'; command{proc exit}; pack ph}    #built in command to exit when clicked
        top.pack('fill'=>'both', 'side'=>'top')
    end

    def hello
        @text.value = "Hello, " + @text.value
    end
end
HelloWorld.new
Tk.mainloop