#!/usr/bin/perl
use warnings;
use strict;
use feature qw(say);
my @days;
@days = qw(Monday Tuesday Wednesday Thursday Friday Saturday Sunday);
##sort by ASCII (Alphabetical) order
@days = sort(@days);
say "Sorted in ASCII @days"; 

##sort in reverse ASCII order
@days = sort {$b cmp $a} (@days);
say "Sorted in reverse 1 ASCII @days";

##sort in reverse ASCII order by different method
@days = sort(@days);
@days = reverse(@days);
say "Sorted in reverse 2 ASCII @days";


#sort an array by numerical sort
my @days2 = qw (7 3 2 1 4 5 6);
@days2 = sort{$a <=> $b}(@days2);
say "Sorted acending numberical days @days2";
@days2 = sort{$b <=> $a}(@days2);
say "Sorted decending numberical days @days2";


