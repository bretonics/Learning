#!/usr/bin/perl

use warnings;
use strict;

####
#	Andres Breton
#	File: testTheChild.pl	Test child age by length of word
####

print "Enter word to guess child's age: ";
my $word = <STDIN>;
chomp $word;
my $wordLen = length($word);

my %age = ( # wordLength => age
    3 => "5 years old",
    4 => "6 years old",
    6 => "8 years old",
    10 => "10 years old",
);

if ($wordLen < 3) {
    print "\nYour child is less than 5 years old\n\n";
}
elsif ($wordLen == 3 || $wordLen == 4 || $wordLen == 6|| $wordLen == 10) {
    print "\nYour child is $age{$wordLen}\n\n";
}
elsif ($wordLen == 5) {
    print "\nYour child is between 6 and 8 years old\n\n";
}
elsif ($wordLen ~~ [6..10]) {
    print "\nYour child is between 8 and 10 years old\n\n";
}
elsif ($wordLen > 10) {
    print "\nYour child is older than 10 years\n\n";
}