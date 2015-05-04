#!/usr/bin/perl
use warnings;
use strict;
use feature qw(say);
my $apples = 4;
my $oranges = 7;
my $pears = 3;

say "Assignment Operators";
say "= \$apples";
my $bananas = $apples;
say "I now have as many bananas as i do apples " ,  $bananas;

print "+= \$bananas\n";
$bananas += $bananas;
say "I how have " , $bananas , " bananas";

print "-= 2\n";
$bananas -= 2;
say "I how have " , $bananas , " bananas";

print "*= 2\n";
$bananas *= 2;
say "I how have " , $bananas , " bananas";

print "/= 2\n";
$apples /= 2;
say "I now have " , $apples , " apples";
