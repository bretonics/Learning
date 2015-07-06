#!/usr/bin/perl

use warnings;
use strict;

####
#	Andres Breton
#	File: circumference.pl	Circumference
###

my $pi = 3.1416;

print "What is the radius of the circle? ";
my $radius = <STDIN>;
chomp $radius;
my $circumference = 2 * $pi * $radius;
unless ($radius >0) {
    die "Your circle is our of this world! A real circle has a radius greater than 0", $!;
}
print "The circumference of your circle is $circumference\n";
