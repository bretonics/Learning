#!/usr/bin/perl

use warnings;
use strict;
use diagnostics;
use feature qw(say);

####
#       Andres Breton
#       File: stats.pl
###


## VARIABLES
my @numbers;
my $lower = 10;
my $upper = 20;
my $measures = int(rand($upper - $lower)) + $lower; #Assigns # of measures in 10-20 range 
say "Number of measures used = $measures";

for (my $i = 0; $i < $measures; $i++) { 	#Assigns random integers to array with $measures as the number of elements (10-20)
	$numbers[$i] = int(rand(101));
	}
	

## CALLS
my ($mean, $variance, $standDev) = statsCalc(@numbers);
my @words = ("mean", "variance", "standard deviation");

my $i = 0;
foreach ($mean, $variance, $standDev) {
	say "The $words[$i] is $_";
	$i++;
}


## SUBS
sub statsCalc {
	my (@numbers) = @_;
	
	## Total
	my $total = 0;
	for (@numbers) {
		$total = $total + $_;
		}
		
	## Other
	my $count = @numbers;
	my $mean = $total/$count;
	
	## Variance
	my $variance = 0;
	for (@numbers) {
		$variance = $variance + (($_ - $mean)**2)/($count-1)
		}
		
	## Standard Deviation
	my $standDev = sqrt($variance);
	
	return $mean, $variance, $standDev;
}