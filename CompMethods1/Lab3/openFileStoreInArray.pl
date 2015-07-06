#!/usr/bin/perl

use warnings;
use strict;

####
#	Andres Breton
#	File: openFile.pl	Open, enter to array, creat output file
###

my $inFile = $ARGV[0];
my $outFile = $ARGV[1];

## Checks

if (! $inFile || !$outFile) {
	die "You did not provide an input and/or output file";
}

unless (open(INFILE, "<", $inFile)) {
	die "Can not open file $inFile", "\n",$!;
}

unless(open(OUTFILE, ">", $outFile)){
    die "Can not open output file $outFile for writing", "\n", $!;
}

##  Output File

my @fileArray = <INFILE>;
my $arrayLen = @fileArray;


open(OUTFILE, ">", $outFile);
for (my $i = 0; $i < $arrayLen; $i++) {
    print OUTFILE $i, " ", $fileArray[$i];
}
close INFILE;
close OUTFILE;


#print $arrayLen, "\n";
#print "List array=", (@fileArray), "\n";
#print "Scalar array=", @fileArray, "\n";
