#!/usr/bin/perl

use warnings;
use strict;
use diagnostics;
use feature qw(say);

####
#	Andres Breton
#	File: compareDataFile.pl	Compare data files in tab delim
###

my $inFile = $ARGV[0];
my $inFile2 = $ARGV[1];
my %gene;
my %IDs;




## Checks

if (! $inFile || ! $inFile2) {
	die "You did not provide input files";
}

unless (open(INFILE, "<", $inFile)) {
	die "Can not open file $inFile", "\n",$!;
}

unless (open(INFILE2, "<", $inFile2)) {
    die "Can not open file $inFile", "\n",$!;
}


###
for (<INFILE>) {
    chomp;
    my @line = split /\t/;
    $gene{$line[1]} = $_;
    
}

while (<INFILE2>) {
    chomp;
    my @line2 = split /\t/;
    $IDs{$line2[1]} = $_;
    
    if (exists $gene{$line2[1]}) {
        say $line2[1];
    }
}
