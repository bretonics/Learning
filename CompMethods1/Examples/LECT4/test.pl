#!/usr/bin/perl
use warnings;
use strict;
use feature qw(say);
my @genes = qw(HOXB1 ALPK1 TP53);
say "String of genes: \n" , join ("\n", @genes);
print "String of genes: \n" , join ("\n", @genes) , "\n";

