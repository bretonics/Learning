#! /usr/bin/perl
use strict;
use warnings;
use feature qw(say);


my %hash1 = ( ITALY => "ROME",
              FRANCE => "PARIS"
            );
my %hash2 = ( ITALY => "MILAN",
              FRANCE => "PARIS"
            );
my %hash3 = ( ITALY => "ROME" );

my %hash4 = ( SPAIN => "ROME",
              FRANCE => "PARIS" 
            );

my $value1 = compareHash(\%hash1,\%hash1);
my $value2 = compareHash(\%hash1,\%hash2);
my $value3 = compareHash(\%hash1,\%hash3);
my $value4 = compareHash(\%hash1,\%hash4);

printResults($value1,\%hash1,\%hash1);
printResults($value2,\%hash1,\%hash2);
printResults($value3,\%hash1,\%hash3);
printResults($value4,\%hash1,\%hash4);


sub compareHash{
        my %hashValue1 = %{+shift};
        my %hashValue2 = %{+shift};

my $hashKeyNumber1 = keys %hashValue1;
my $hashKeyNumber2 = keys %hashValue2;

#say $hashKeyNumber1,"  ",$hashKeyNumber2;

my $count = $hashKeyNumber1;

if ($hashKeyNumber1 == $hashKeyNumber2){
        for my $key1 (keys %hashValue1){
                        for my $key2 (keys %hashValue2){
                                if ( $key1 eq $key2){
                                        if ($hashValue1{$key1} eq $hashValue2{$key2}){
                                                #say $key1," keys ",$key2, "\n"; 
                                                #say $hashValue1{$key1}," value ",$hashValue2{$key2},"\n";
                                               	#say $hashValue1{$key1}," value ",$hashValue2{$key2},"\n";
                                                #say "count", $count;
                                                $count--;
                                                if ($count==0){
                                                        return "true";
                                                }
                                        }
                                }
                        }
                }

        }
        return "false";
}

sub printResults{
        my $value = shift;
        my %hash1 = %{+shift};
        my %hash2 = %{+shift};

say "First Hash: \n";
say map { "$_ => $hash1{$_}\n"} keys %hash1;

say "Second Hash: \n";
say map { "$_ => $hash2{$_}\n"} keys %hash2;

if ($value eq "true"){
        say "Two above hashes are equal";
}
else {
        say "Two above hashes are not equal";
}
} 

