#!/usr/bin/perl
use warnings;
use strict;
use feature qw(say);

# STRINGS TO BE FORMATTED
my $mystring = "Welcome to bioinformatics class!"; #String to be formatted
my $newline = "Welcome to \nbioinformatics class!";
my $capitalLetter = "\uwelcome to bioinformatics class!";
my $allCaps = "\Uwelcome to bioinformatics class!";
my $allLower = "\L$allCaps";

# PRINT THE NEWLY FORMATTED STRINGS
print $mystring, "\n";
print $newline ,  "\n";
print $capitalLetter, "\n";
print $allCaps, "\n";
print $allLower , "\n";

print "\n\n";

#say is like print, but no need for \n
say $mystring;
say $newline;
say $capitalLetter;
say $allCaps;
say $allLower;
