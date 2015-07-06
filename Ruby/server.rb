#!/usr/bin/ruby

#####################
#
# 	Created by: breton 
#	File: server.rb
#
#####################


# Network Programming
# TCP Server

require "socket"

server = TCPServer.open(1500)
loop {
    client = server.accept
    client.puts("Hello, client")
    client.puts("Goodbue, client")
    client.puts("closing conncetion...")
    client.close
    
}
