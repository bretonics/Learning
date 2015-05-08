#!/usr/bin/perl

use warnings;
use strict;

#Declaring Variables

my $pi = 3.14;
my $pi2;
my $pi3;

#Copying Values

$pi3 = $pi2 = $pi;

print $pi, $pi2, $pi3, "\n";

#String or Number

if ($pi2 == "1"){
	print "1) yes it is, pi2 = 3.14\n";
}

if ($pi2 == "3.14"){
	print "2) yes it is, pi2 = 3.14\n";
}

if ($pi2 == "3.14"){
	print "3) yes it is, pi2 = 3.14\n";
}

if ($pi2 == $pi){
	print "4) yes it is, pi2 = pi\n";
}