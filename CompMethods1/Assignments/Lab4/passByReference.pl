#!/usr/bin/perl

use warnings;
use strict;
use diagnostics;
use feature qw(say);

####
#       Andres Breton
#       File: passByReference.pl
###


## VARIABLES
my $inFile = $ARGV[0];


## CHECKS
unless (open(INFILE, "<", $inFile)) {
	die "Can not open file $inFile", "\n",$!;
}


## CALLS
my @fileArray = <INFILE>;
passByReference(\@fileArray);
say "\nArray in main:";
say  @fileArray;

## SUBS
sub passByReference {
	my ($subFile) = @_;
	#say "Thisis subfile @$subFile";
	$subFile->[0] = "changed";
}

