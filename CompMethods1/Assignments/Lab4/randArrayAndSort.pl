#!/usr/bin/perl

use warnings;
use strict;
use diagnostics;
use feature qw(say);

####
#       Andres Breton
#       File: randArrayAndSort.pl
###


## VARIABLES
my @randArray;

for (my $i = 0; $i < 100; $i++) {
	$randArray[$i] = int(rand(101));
}

@randArray = sort {$a <=> $b} (@randArray);

for (my $i = 0; $i < 10; $i++) {
	print $randArray[$i], "\t";
}
print "\n";

