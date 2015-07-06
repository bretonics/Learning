#! /usr/bin/perl
use strict;
use warnings;
use diagnostics;
use feature qw(say);

#####################
#
# 	Created by: Andres Breton
#	File: hashComparison.pl
#
#####################
#	Compares hashes based on criteria:
#		1. The numbers of keys for two hashes are equal.
#		2. The lists of keys for the two hashes are equal.
#		3. The values corresponding to identical keys are equal.
#####################

my %hash1 = ( 
ITALY => "ROME",
FRANCE => "PARIS"
);

my %hash2 = ( 
ITALY => "MILAN",
FRANCE => "PARIS"
);

my %hash3 = ( 
ITALY => "ROME" );

my %hash4 = ( 
SPAIN => "ROME",
FRANCE => "PARIS"
);

my $comp1 = compareHashes(\%hash1, \%hash1);
my $comp2 = compareHashes(\%hash1, \%hash2);
my $comp3 = compareHashes(\%hash1, \%hash3);
my $comp4 = compareHashes(\%hash1, \%hash4);


sub compareHashes {
	my ($hash1, $hash2) = @_;
	my %hashRef1 = %$hash1;
	my $hashKeys1 = (keys %hashRef1);
	my $keySize1 = $hashKeys1;
	
	my %hashRef2 = %$hash2;
	my $hashKeys2 = (keys %hashRef2);
	my $keySize2 = $hashKeys2;
	say "First Hash: ", %hashRef1;
	say "Second Hash: ", %hashRef2, "\n";
	
	if ($hashKeys1 == $hashKeys2) {
		my $counter = $hashKeys1;
		#say "Hash1 keys= ", $hashKeys1;
		#say "Hash2 keys= ", $hashKeys2;
		for my $key1 (keys %hashRef1) {
			#say "Hash key1=", $key1;
			for my $key2 (keys %hashRef2) {
				#say "Hash key2=", $key2;
				if ($key1 eq $key2) {
					#say "Keys 1 and 2 are equal";
					#say %hashRef1{$key1};
					if ($hashRef1{$key1} eq $hashRef2{$key2}) {
						#say "Values for keys 1 and 2 are equal"
						$counter--;
						if ($counter == 0) {
							return printHashResults("equal");
						}
					}
				}
			} 
		}
	} 
	printHashResults("not");
}

sub printHashResults {
	my ($result) = @_;
	if ($result eq "equal") {
		say "The two hashes are the same\n";
	}else {
		say "The two hashes are not the same\n";
	}
}