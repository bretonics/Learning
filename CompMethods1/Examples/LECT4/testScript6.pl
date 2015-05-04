#! /usr/bin/perl
use warnings;
use strict;
use feature qw(say);
#intialize a Hash
my %french = (
        apple  => "pomme",
        pear   => "poivre",
        orange => "Leon Brocard"
);


##access a specific key in the Hash
my $var = $french{apple};
say "\nThe word apple is " , $var , " in the French language\n";


##add a new key to the hash
$var = $french{quite} = 'tout fait';
say "The word quiet is " , $var , " in the French language\n";

#keys must be unique, there are not duplicates
$var = $french{quite} = 'silence';
say "The word quiet is " , $var , " in the French language\n";


#Copy a Hash
say "here I copied the hash";
my %french2 = %french;
say %french2; 


#delete an key/value pair
my $numkeys = keys %french2;
say "\nBefore I delete there were " , $numkeys , " in the hash french";
delete $french2{apple};
$numkeys = keys %french2;
say "Now I deleted a key, there are " , $numkeys , " in the hash french";
