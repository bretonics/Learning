#!/usr/bin/perl
use warnings;
use strict;
use feature qw(say);

my $var1 = 1;
my $var2 = 1;
my $var3 = 3;
say "my values";
say '$var1 = ' , $var1;
say '$var2 = ' , $var2;
say '$var3 = ' , $var3;


##Logical Operators

if ( ($var1 == $var2) && ($var3 != 1) ){
	say 'TRUE ($var1 == $var2) && ($var3 != 1)'
}
else{
	say 'NOT TRUE ($var1 == $var2) && ($var3 != 1)'
}



if ( ($var1 >= $var3)  && ($var3 != 1) ){
	say 'TRUE ($var1 >= $var2) && ($var3 != 1)'
}
else{
	say 'NOT TRUE ($var1 >= $var2) && ($var3 != 1)'
}


#=cut

if ( ($var1 >= $var3)  || ($var3 != 1) ){
	say 'TRUE ($var1 >= $var2) || ($var3 != 1)'
}
else{
	say 'NOT TRUE ($var1 >= $var2) || ($var3 != 1)'
}



