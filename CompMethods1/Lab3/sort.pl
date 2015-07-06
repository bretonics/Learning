#!/usr/bin/perl

use warnings;
use strict;

####
#	Andres Breton
#	File: sort.pl	Sort file content
###

my $inFile = $ARGV[0];

##  CHECKS
if(! $inFile) {
    die "You did not provide an input file", $!;
}

unless (open(INFILE, "<", $inFile)) {
    die "Can not open input file $inFile", $!;
}

## OPEN/READ FILE
my @fileValues;
my $arrayLen = @fileValues;

for (<INFILE>) {
    chomp;
    my @values = split /\t/;
    push @fileValues, @values;
    #print "Line values are @values\n";
    #print "Value array length = $arrayLen\n";
}

print "\nNumbers in asceding order:\n";
my @sortedVals = (sort {$a<=>$b} @fileValues); #ascending order
foreach my $values (@sortedVals) {
    print $values, "\n";
}
print "\nNumbers in descending order:\n";
my @sortedVals = (sort {$b<=>$a} @fileValues); #descending order
foreach my $values (@sortedVals) {
    print $values, "\n";
}

#tried using for loop w/ iteration, why not?
#for (my $i = 0; $i < $arrayLen; $i++) {
#    print "Values are @fileValues\n";
#    print $sortedVals[$i];
#}
