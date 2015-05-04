#!/usr/bin/perl
use warnings;
use strict;
use feature qw(say);
my $a = 1;
my $b = 2;
say "my values\n";
say '$a = ' , $a;
say '$b = ' , $b;

##################
say "\n==";
if ($a == $b){ ## returns 0
	say 'TRUE $a == $b';
}
else{
	say 'NOT TRUE $a == $b';
}
if ($b == $a){ # returns 0
	say 'TRUE $b == $a';
}
else{
	say 'NOT TRUE $b == $a';
}
if ($a == $a){ # returns 1
	say 'TRUE $a == $a';
}
else{
	say 'NOT TRUE $a == $a';
}
say "\n";
##################
say "=";
if ($a != $b){ ## returns 1
	say 'TRUE $a != $b';
}
else{
	say 'NOT TRUE $a != $b';
}
if ($b != $a){ # returns 1
	say 'TRUE $b != $a';
}
else{
	say 'NOT TRUE $b != $a';
}
if ($a != $a){ # returns 0
	say 'TRUE $a != $a';
}
else{
	say 'NOT TRUE $a != $a';
}
say "\n";
##################
say "<";
if ($a < $b){ ## returns 1
	say 'TRUE $a < $b';
}
else{
	say 'NOT TRUE $a < $b';
}
if ($b < $a){ # returns 0
	say 'TRUE $b < $a';
}
else{
	say 'NOT TRUE $b < $a';
}
if ($a < $a){ # returns 0
	say 'TRUE $a < $a';
}
else{
	say 'NOT TRUE $a < $a';
}
say "\n";
##################
say "=";
if ($a <= $b){ ## returns 1
	say 'TRUE $a <= $b';
}
else{
	say 'NOT TRUE $a <= $b';
}
if ($b <= $a){ # returns 0
	say 'TRUE $b <= $a';
}
else{
	say 'NOT TRUE $b <= $a';
}
if ($a <= $a){ # returns 1
	say 'TRUE $a <= $a';
}
else{
	say 'NOT TRUE $a <= $a';
}
say "\n";
##################
say ">";
if ($a > $b){ ## returns 0
	say 'TRUE $a > $b';
}
else{
	say 'NOT TRUE $a > $b';
}
if ($b > $a){ # returns 1
	say 'TRUE $b > $a';
}
else{
	say 'NOT TRUE $b > $a';
}
if ($a > $a){ # returns 0
	say 'TRUE $a > $a';
}
else{
	say 'NOT TRUE $a > $a';
}
say "\n";
##################
say ">=";
if ($a >= $b){ ## returns 0
	say 'TRUE $a >= $b';
}
else{
	say 'NOT TRUE $a >= $b';
}
if ($b >= $a){ # returns 1
	say 'TRUE $b >= $a';
}
else{
	say 'NOT TRUE $b >= $a';
}
if ($a >= $a){ # returns 1
	say 'TRUE $a >= $a';
}
else{
	say 'NOT TRUE $a >= $a';
}

