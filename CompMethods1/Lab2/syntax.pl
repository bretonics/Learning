#!/usr/bin/perl

use warnings;
use strict;
#use feature qw(sa);

my $bases = "ATGCTAGCTATCA";
my $numBasePairs = "500000000";
my $firstInitial = "A";

if ($firstInitial eq "A") {
	print "My first initial is $firstInitial", "\n";
}

printBases($bases);

sub printBases {
	my ($basesWithInSub) = @_;
	print $basesWithInSub, "\n";
}


