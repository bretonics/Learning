#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: converter.rb
#
#####################

require 'tk'

class Converter
    def initialize
        ph = {'padx'=>10, 'pady'=>10}
        p = proc {convert}      #method called when making temp convertion
        @textF = TkVariable.new     #holds temperatures
        @textC = TkVariable.new
        root = TkRoot.new {title 'Temperature Converter'}
        top = TkFrame.new(root)
        TkLabel.new(top) {text 'Top: Fahrenheit Boottom: Celcius'; pack(ph)}    #label indicated top and bottom widgets
        @entryFahr = TkEntry.new(top, 'textvariable'=>@textF)
        @entryFahr.pack(ph)
        @entryCel = TkEntry.new(top, 'textvariable'=>@textC)
        @entryCel.pack(ph)
        TkButton.new(top) {text 'Convert'; command p; pack ph}
        TkButton.new(top) {text 'Exit'; command {proc exit}; pack ph}
        top.pack('fill'=>'both', 'side'=>'top')
    end

    def convert
        if @textF != ""
            @textC.value = (5.0/9.0) * (@textF - 32.0)
        else
            @textF.value = (9.0/5.0) * (@textC + 32.0)
        end
    end
end

Converter.new
Tk.mainloop