#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);

my $rnaSeq = <STDIN>;
chomp $rnaSeq;
say "You wrote " , $rnaSeq;
##don't chop
chop $rnaSeq;
say "You wrote " , $rnaSeq;



