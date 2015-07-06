#!/usr/bin/perl 

use warnings;
use strict;
use diagnostics;
use feature qw(say);

##########################
#
# 	Created by: Andres Breton
#	FV: translateRNAToProtein.pl
#
##########################


say "Enter RNA/DNA sequence to translate: ";

##########################
# VARIABLES
my $desig = $ARGV [0];		#Allow return protein in 1 or 3 letter designations (A vs Ala)
my $sequence = <STDIN>;
chomp $sequence;
my @nucs = split("", $sequence); #Split sequence characters to get # of letters
my $seqLen = @nucs;


#########################
# HASHES

my %transTable = (
	GCA	=> "A",
	GCC	=> "A",
	GCG	=> "A",
	GCT	=> "A",
	GCU	=> "A",
	AGA	=> "R",
	AGG	=> "R",
	CGA	=> "R",
	CGC	=> "R",
	CGG	=> "R",
	CGT	=> "R",
	CGU	=> "R",
	AAC	=> "N",
	AAT	=> "N",
	AAU	=> "N",
	GAC	=> "D",
	GAT	=> "D",
	GAU	=> "D",
	TGC	=> "C",
	UGC	=> "C",
	TGT	=> "C",
	UGU	=> "C",
	CAG	=> "Q",
	CAA	=> "Q",
	GAG	=> "E",
	GAA	=> "E",
	GGT	=> "G",
	GGU	=> "G",
	GGG	=> "G",
	GGC	=> "G",
	GGA	=> "G",
	CAT	=> "H",
	CAU	=> "H",
	CAC	=> "H",
	ATT	=> "I",
	AUU	=> "I",
	ATC	=> "I",
	AUC	=> "I",
	ATA	=> "I",
	AUA	=> "I",
	TTG	=> "L",
	UUG	=> "L",
	TTA	=> "L",
	UUA	=> "L",
	CTT	=> "L",
	CUU	=> "L",
	CTG	=> "L",
	CUG	=> "L",
	CTC	=> "L",
	CUC	=> "L",
	CTA	=> "L",
	CUA	=> "L",
	AAG	=> "K",
	AAA	=> "K",
	ATG	=> "M",
	AUG	=> "M",
	TTC	=> "F",
	UUC	=> "F",
	TTT	=> "F",
	UUU	=> "F",
	CCT	=> "P",
	CCU	=> "P",
	CCG	=> "P",
	CCC	=> "P",
	CCA	=> "P",
	TCT	=> "S",
	UCU	=> "S",
	TCG	=> "S",
	UCG	=> "S",
	TCC	=> "S",
	UCC	=> "S",
	TCA	=> "S",
	UCA	=> "S",
	AGT => "S",
	AGU => "S",
	AGC	=> "S",
	ACT	=> "T",
	ACU	=> "T",
	ACG	=> "T",
	ACC	=> "T",
	ACA	=> "T",
	TGG	=> "W",
	UGG	=> "W",
	TAC	=> "T",
	UAC	=> "T",
	TAT	=> "T",
	UAU	=> "T",
	GTT	=> "V",
	GUU	=> "V",
	GTG	=> "V",
	GUG	=> "V",
	GTC	=> "V",
	GUC	=> "V",
	GTA	=> "V",
	GUA	=> "V",
	TAA	=> "*",
	UAA	=> "*",
	TAG	=> "*",
	UAG	=> "*",
	TGA	=> "*",
	UGA	=> "*"
);

my %transTableFull = (
	GCA	=> "Ala",
	GCC	=> "Ala",
	GCG	=> "Ala",
	GCT	=> "Ala",
	GCU	=> "Ala",
	AGA	=> "Arg",
	AGG	=> "Arg",
	CGA	=> "Arg",
	CGC	=> "Arg",
	CGG	=> "Arg",
	CGT	=> "Arg",
	CGU	=> "Arg",
	AAC	=> "Asn",
	AAT	=> "Asn",
	AAU	=> "Asn",
	GAC	=> "Asp",
	GAT	=> "Asp",
	GAU	=> "Asp",
	TGC	=> "Cys",
	UGC	=> "Cys",
	TGT	=> "Cys",
	UGU	=> "Cys",
	CAG	=> "Gln",
	CAA	=> "Gln",
	GAG	=> "Glu",
	GAA	=> "Glu",
	GGT	=> "Gly",
	GGU	=> "Gly",
	GGG	=> "Gly",
	GGC	=> "Gly",
	GGA	=> "Gly",
	CAT	=> "His",
	CAU	=> "His",
	CAC	=> "His",
	ATT	=> "Ile",
	AUU	=> "Ile",
	ATC	=> "Ile",
	AUC	=> "Ile",
	ATA	=> "Ile",
	AUA	=> "Ile",
	TTG	=> "Leu",
	UUG	=> "Leu",
	TTA	=> "Leu",
	UUA	=> "Leu",
	CTT	=> "Leu",
	CUU	=> "Leu",
	CTG	=> "Leu",
	CUG	=> "Leu",
	CTC	=> "Leu",
	CUC	=> "Leu",
	CTA	=> "Leu",
	CUA	=> "Leu",
	AAG	=> "Lys",
	AAA	=> "Lys",
	ATG	=> "MET",
	AUG	=> "MET",
	TTC	=> "Phe",
	UUC	=> "Phe",
	TTT	=> "Phe",
	UUU	=> "Phe",
	CCT	=> "Pro",
	CCU	=> "Pro",
	CCG	=> "Pro",
	CCC	=> "Pro",
	CCA	=> "Pro",
	TCT	=> "Ser",
	UCU	=> "Ser",
	TCG	=> "Ser",
	UCG	=> "Ser",
	TCC	=> "Ser",
	UCC	=> "Ser",
	TCA	=> "Ser",
	UCA	=> "Ser",
	AGT => "Ser",
	AGU => "Ser",
	AGC	=> "Ser",
	ACT	=> "Thr",
	ACU	=> "Thr",
	ACG	=> "Thr",
	ACC	=> "Thr",
	ACA	=> "Thr",
	TGG	=> "Trp",
	UGG	=> "Trp",
	TAC	=> "Tyr",
	UAC	=> "Tyr",
	TAT	=> "Tyr",
	UAU	=> "Tyr",
	GTT	=> "Val",
	GUU	=> "Val",
	GTG	=> "Val",
	GUG	=> "Val",
	GTC	=> "Val",
	GUC	=> "Val",
	GTA	=> "Val",
	GUA	=> "Val",
	TAA	=> "*",
	UAA	=> "*",
	TAG	=> "*",
	UAG	=> "*",
	TGA	=> "*",
	UGA	=> "*"
);

##########################
# CALLS
if (! $ARGV[0]) {
	translate($sequence, \%transTable); #Call sub for 1 letter protein
}
else {
	if ($desig eq "full") { #Call sub for 3 letter protein
		translate($sequence, \%transTableFull);
	}
	elsif ($desig ne "full") { #Call sub for 1 letter protein b/c misspelled "full"
		say "\nProvided wrong protein designation. Type \"full\" for 3 letter protein designation (Alan vs A)";
		say "Using default 1 letter protein designation";
		translate($sequence, \%transTable);
	}
}

##########################
# SUB
sub translate {			#Translate DNA/RNA to protein according to transTable designation
	my ($sequence, $hashRef) = @_;
	my %transTable = %$hashRef;
	print "\nProtein:\n";
	for (my $i = 0; $i < $seqLen; $i+=3) {
		my $codon = substr $sequence, $i, 3;
		print $transTable{$codon};
	}
	print "\n\n";
}