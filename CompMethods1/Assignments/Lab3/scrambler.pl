#!/usr/bin/perl

use warnings;
use strict;

####
#	Andres Breton
#	File: scrambler.pl		
###


#   User Input
print "Enter a phrase: ";
my $message = <STDIN>;
chomp $message;


#   Sanitation
my $messageLen = length($message);
my $num = int(rand($messageLen)); #Assign random number < input length
my $negNum = $num * -1;

#print "Rand num before: $num\n";

#sub changeRandom {
#    my $num;
#    while ($num <=1) {
#    my $num = int(rand($messageLen));
#    }
#    print "Generating new random number = $num\n";
#}
#if ($num <= 1) {
#    changeRandom("$num");
#    #my $num = int(rand($messageLen));
#    #print "Generating new random number = $num\n";
#}
#print "Rand num after: $num\n";


#   Scrambler: Scrambles first/last letters to random number
my $scrambledFirst = substr $message, 0 , $num;
my $inBetween = substr $message, $num, $negNum;
my $scrambledLast = substr $message, $negNum;

print "\nYour original message was: $message\n";
print "This is your new message: ", scalar reverse($scrambledFirst), $inBetween, scalar reverse($scrambledLast), "\n\n";