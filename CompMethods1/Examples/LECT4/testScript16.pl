#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);

`revseq mySeq.fasta mySeq_rc.fasta 2>/dev/null`;


my $date = `date`;
my $revCom = `revseq mySeq.fasta -filter 2>/dev/null`; 

say "date: " , $date;
say "Reverse compliment: " , "\n" , $revCom;
