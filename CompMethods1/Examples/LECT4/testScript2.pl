#! /usr/bin/perl
use warnings;
use strict;
use feature qw(say);

my $pi1 = 3.14;
my $pi2 = "3.14";
my $pi3 = $pi1 + $pi2;
say "pi3 is " , $pi3;
$pi3 = "ThreePointOneFour";
$pi3 = $pi2 + $pi3;
say "pi3 is " , $pi3;

