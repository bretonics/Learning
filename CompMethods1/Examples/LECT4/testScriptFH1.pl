#! /usr/bin/perl 
use warnings;
use strict;
use feature qw(say);
my $file = 'nlexample.txt';

unless (open(INFILE, "<", $file) ){
	die "can't open " , $file , " " , $!;

}
my $lineNo = 0;
while (<INFILE>){
	chomp $_;
	$lineNo++;
	say $lineNo , " " , $_;
}

close INFILE;
