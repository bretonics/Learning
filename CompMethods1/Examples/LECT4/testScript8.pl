#!/usr/bin/perl
use warnings;
use strict;
use feature qw(say);
my $apples = 4;
my $oranges = 7;
my $pears = 3;
my $bananas;

say "\n";
say <<"EOT";
Here are my fruit
apples = $apples
organges = $oranges
pears = $pears
EOT

say "Modifier Operators\n";

#add
say 'my $bananas = $apples + $pears';
$bananas = $apples + $pears;
say "I have " , $bananas , " bananas";
say "\n";


#subtract
say 'my $bananas = $apples - $pears';
$bananas = $apples - $pears;
say "I have " , $bananas , " bananas";
say "\n";

##multiply
print 'my $bananas = $apples * $pears';
$bananas = $apples * $pears;
say "I have " , $bananas , " bananas";
say "\n";

##divide
say 'my $bananas = $oranges / $pears';
$bananas = $oranges / $pears;
say "I have " , $bananas , " bananas";
say "\n";

##++
say '$bananas++';
$bananas++;
say "I have " , $bananas , " bananas";
say "\n";

##--
say '$bananas--';
$bananas--;
say "I have " , $bananas , " bananas";
say "\n";

##**
say '$bananas = 3';
say '$bananas = $bananas**2';
$bananas=3;
$bananas = $bananas**2;
say "I have " , $bananas , " bananas";
say "\n";



