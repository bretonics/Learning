#!/usr/bin/perl

use warnings;
use strict;

my $dna = "ATGACAGTCA";
my @bases = ("A","T", "G", "C", "U");
my %purines = (
A => "Adenine",
G => "Guanine"
);

print $dna, "\n";
print @bases, "\n";
print %purines, "\n";
