#!/usr/bin/perl

#use warnings;
#use strict;

#####
##       Andres Breton
##       File: isPalindrome.pl
####

print "Enter sequence: ";
my $DNA = uc <STDIN>;
chomp $DNA;
my $palindrome = reverse $DNA;

print "Your DNA is $DNA\n";
print "Your palindrome is $palindrome\n";

if ($DNA eq $palindrome) {
    print "You have a palindrome!\n";
    }
    else {
       print "Sorry, no palindrome observed\n";
        }


