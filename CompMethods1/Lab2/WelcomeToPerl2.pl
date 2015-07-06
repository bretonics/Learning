#!/usr/bin/perl

use warnings;
use strict;
use feature qw(say);

my $version = "5.14";
my $welcome1 = "Welcome to Perl $version (double quotes)";
my $welcome2 = 'Welcome to Perl $version (single quotes)';
my $name = "Andres";

say $welcome1, " ", $name;
say $welcome2, " ", $name;