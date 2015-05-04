#!/usr/bin/perl
use warnings;
use strict;
use feature qw(say);
#declare variables
my $pi1 = 3.14;
my $pi2;
my $pi3;

#copy values
$pi3 = $pi2 = $pi1;

say "pi3 " , $pi3 , " pi2 " , $pi2;

##pi2 is a string, but perl will think of it as a number
$pi2 = "3.14";
##can we can then add them, right?
$pi3 = $pi1 + $pi2;
##Lets see
say "pi3 " , $pi3;


##Now if it’s a number, or is it a string?
if ($pi2 eq "1" ){
        say "1 yes it is, pi2 is equal to 3.14";
}
else{}
if ($pi2 eq "3.14" ){
        say '2 yes it is, pi2 is eq to "3.14"';
}
else{}
if ($pi2 == "3.14" ){
        say '3 yes it is, pi2 is == to "3.14"';
}
else{}
if ($pi2 == $pi1 ){
        say "4 yes it is, pi2 is == to pi1";
}
else{}
