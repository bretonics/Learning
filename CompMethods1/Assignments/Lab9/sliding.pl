#!/usr/bin/perl 

use warnings;
use strict;
use diagnostics;
use feature qw(say);

#####################
#
# 	Created by: Andres Breton
#	File: sliding.pl
#
#####################
#   Function:
#      GC content window size
#
#
#####################

my $windowSize = $ARGV[0];
my $sequence = uc $ARGV[1];
my $seqLen = length $sequence;

say "\nWindow        GC";
    
for (my $i = 0; $i < $seqLen; $i++) {
    my $window = substr $sequence, $i, $windowSize;
    #say "This is window $window";
    my $curentWindowSize = length $window;
    #say "Current size $curentWindowSize";
    if ($curentWindowSize < $windowSize) {
        exit;
    }
    my $counterG = $window =~ tr/G//;
    my $counterC = $window =~ tr/C//;
    
    my $gc = ($counterG + $counterC)/$windowSize;

    printf "%d             %.2f" , $i, $gc;
    print "\n";
} 
