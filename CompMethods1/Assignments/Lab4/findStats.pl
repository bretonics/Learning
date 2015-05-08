#!/usr/bin/perl

use warnings;
use strict;
use diagnostics;
use feature qw(say);

####
#       Andres Breton
#       File: findStats.pl
###


## VARIABLES
my @numbers = (1..10);
my ($total, $count, $average) = statsCalc(@numbers);
my @words = ("total", "count", "average");


## CALLS
my $i = 0;
foreach ($total, $count, $average) {
	say "The $words[$i] is $_";
	$i++;
}


## SUB
sub statsCalc {
	my (@numbers) = @_;
	my $total = 0;
	for (@numbers) {
		$total = $total + $_;
	}
	my $count = @numbers;
	my $average = $total/$count;
	
	return $total, $count, $average;
}
