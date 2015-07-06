#!/usr/bin/perl

use warnings;
use strict;

####
#	Andres Breton
#	File: equation.pl		Solve the Equation
###

my $a = 2;
my $a2 = -20;
my $b = 3;
my $b2= 4;
my $c = 4;
my $c2 = 3;

calc($a, $b, $c);
calc($a2, $b2, $c2);

sub calc {
	my ($val1, $val2, $val3) = @_;
	my $x = sqrt((($val1+$val2)**2))/$val3;
	print $x, "\n";
}