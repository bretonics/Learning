#!/usr/bin/perl

my @mixedArray = (543, "bye", 13.232, 23e10);

for (my $i=0; $i < 4; $i++){
	print $mixedArray[$i], "\n";
}