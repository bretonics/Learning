#!/usr/bin/perl 

use warnings;
use strict;
use diagnostics;
use feature qw(say);

#####################
#
# 	Created by: 
#	File:
#
#####################

say "Enter coefficient for x^2: ";
my $a = <STDIN>;
say "Enter coefficient for x: ";
my $b = <STDIN>;
say "Enter constant: ";
my $c = <STDIN>;


my $delta = delta($a, $b, $c);

if ($delta > 0) {
	my $root = ((-$b) + sqrt($delta))/(2*$a);
	my $root2 = ((-$b) - sqrt($delta))/(2*$a);
	say "Your equation has two roots";
	say "The first root is: $root";
	say "The second root is: $root2";
}
elsif ($delta == 0) {
	my $root = (-$b)/(2*$a);
	say "Your equation yields two identical roots: $root";
}
else {
	say "The equation does not have a real solution with numbers provided";
}

sub delta {
	my ($a, $b, $c) = @_;
	my $delta = ($b**2)-(4*$a*$c);
	return $delta;
}