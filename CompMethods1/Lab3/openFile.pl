#!/usr/bin/perl

use warnings;
use strict;

####
#	Andres Breton
#	File: openFile.pl	Open and print file content
###

my $inFile = $ARGV[0];

## CHECKS
if (! $inFile) {
	die "You did not provide an input file";
}

unless (open(INFILE, "<", $inFile)) {
	die "Can not open file $inFile", "\n",$!;
}


## READ FILE
while (my $fileLine = <INFILE>){
	chomp $fileLine;
	print $fileLine, "\n";
}

close INFILE;