#!/usr/bin/perl

use warnings;
use strict;
use diagnostics;

####
#       Andres Breton
#       File: passScalar.pl
###

my $dna = "atggttt";

reverseSequence($dna);

sub reverseSequence {
    my ($sequence) = @_;
    my $reverse = reverse $sequence;
    print "Reverse: $reverse\n";
    return $reverse;
}
print "Original: $dna\n";