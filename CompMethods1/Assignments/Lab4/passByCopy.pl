#!/usr/bin/perl

use warnings;
use strict;
use diagnostics;
use feature qw(say);

####
#       Andres Breton
#       File: passByCopy.pl
###


## VARIABLES
my $inFile = $ARGV[0];

## CHECKS
unless (open(INFILE, "<", $inFile)) {
	die "Can not open file $inFile", "\n",$!;
}

## CALLS
my @fileArray = <INFILE>;
say "Normal content:\n @fileArray\n";
say "Changed content:";

passByCopy(@fileArray);


## SUBS
sub passByCopy {
	my @fileArray = @_;
	$fileArray[0] = "changed";
	#say "Array[0]= $fileArray[0]";
	#say "Array[0]= $subFile[0]";
}

say @fileArray, "\n";