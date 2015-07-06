#!/usr/bin/perl

use warnings;
use strict;

####
#	Andres Breton
#	File: stIn.pl	Open and print file content
###

##	INPUT
print "Enter value 1: ";
my $val1 = <STDIN>;
chomp $val1;
print "Enter value 2: ";
my $val2 = <STDIN>;
chomp $val2;

## 	CHECKS
unless ($val1 =~ /^[+-]?\d+$/ || $val2 =~ /^[+-]?\d+$/) {
	print "Input is not numeric. Please provide numbers\n", $!;
	my $val1 = 0;
	my $val2 = 0;
	inputs($val1, $val2);
}

##	RESULTS
print "The sum of values $val1 + $val2 = ";
addValues($val1, $val2);
print "\nThe product of values $val1 * $val2 = ";
multValues($val1, $val2);
print "\n";

##	SUBS

sub inputs {
	print "Enter value 1: ";
	my $val1 = <STDIN>;
	chomp $val1;
	print "Enter value 2: ";
	my $val2 = <STDIN>;
	chomp $val2;
}

sub addValues {
	my ($val1, $val2) = @_;
	my $addition = $val1 + $val2;
	print $addition; #why not able to use return $addition here?
}
sub multValues {
	my ($val1, $val2) = @_;
	my $product = $val1 * $val2;
	print $product;
}
