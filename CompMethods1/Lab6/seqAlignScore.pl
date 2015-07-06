#! /usr/bin/perl
use strict;
use warnings;
use diagnostics;
use feature qw(say);

#####################
#
# 	Created by: Andres Breton
#	File:	seqAlignScore.pl
#
#####################

say "Please enter 1st sequence: ";
my $seq1 = <STDIN>;
chomp $seq1;
$seq1 = uc $seq1;
my $seq1Len = length($seq1);
my @seq1Array = split("", $seq1);

say "Please enter 2nd sequence: ";
my $seq2 = <STDIN>;
chomp $seq2;
$seq2 = uc $seq2;
my $seq2Len = length($seq2);
my @seq2Array = split("", $seq2);

my ($seqLen, $maxSeqLen) = seqLength($seq1Len, $seq2Len);
seqComparison(\@seq1Array, \@seq2Array, $seqLen, $maxSeqLen);

sub seqLength {
	my ($seq1, $seq2) = @_;
	if ($seq1 > $seq2) {
		my $seqLen = $seq2;
		my $maxSeqLen = $seq1;
		return $seqLen, $maxSeqLen;
	}elsif ($seq1Len < $seq2Len) {
		my $seqLen = $seq1;
		my $maxSeqLen = $seq2;
		return $seqLen, $maxSeqLen;
	}elsif ($seq1Len == $seq2Len) {
		my $seqLen = $seq1;
		my $maxSeqLen = $seq1;
		return $seqLen, $maxSeqLen;
	}
}
sub seqComparison {
	my ($seq1Array, $seq2Array, $seqLen, $maxSeqLen) = @_;
	my @seq1 = @$seq1Array;
	my @seq2 = @$seq2Array;
	my $matches = 0;
	for (my $i = 0; $i < $seqLen; $i++) {
		if ($seq1[$i] eq $seq2[$i]) {
			$matches++;
		}
		if ($i == ($seqLen-1)) {
			alignmentScore($matches, $maxSeqLen);
		}
	}
}

sub	alignmentScore {
	my ($matches, $maxSeqLen) = @_;
	my $score = $matches/$maxSeqLen;
	printf "Allignment score: %.2f\n", $score;
}