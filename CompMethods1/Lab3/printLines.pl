#!/usr/bin/perl

use warnings;
use strict;

####
#	Andres Breton
#	File: printLines.pl		Get user input, print number of lines
####

print "Enter your string of tex: ";
my $text = <STDIN>;
print "Enter a number: ";
my $num = <STDIN>;

unless($num <=100) {
	die "Your number can not be greater than 100.", $!;
}
for (my $i; $i < $num; $i++) {
	print $text, "\n";
}