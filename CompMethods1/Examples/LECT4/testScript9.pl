#!/usr/bin/perl
use warnings;
use strict;
use feature qw(say);

my $a = 'a';
my $b = 'b';
say "my values\n";
say '$a = ' , $a;
say '$b = ' , $b;

##################
say "eq";
if ($a eq $b){ ## returns 0
	say 'TRUE ' , $a , ' eq ' ,  $b;
}
else{
	say 'NOT TRUE ' , $a , ' eq ' ,  $b;
}
if ($b eq $a){ # returns 0
	say 'TRUE ' , $b , ' eq ' ,  $a;
}
else{
	say 'NOT TRUE ' , $b , ' eq ' ,  $a;
}
if ($a eq $a){ # returns 1
	say 'TRUE ' , $a , ' eq ' ,  $a;
}
else{
	say 'NOT TRUE ' , $a , ' eq ' ,  $a;
}
say "\n";
##################
say "ne";
if ($a ne $b){ ## returns 1
	say 'TRUE ' , $a , ' ne ' ,  $b;
}
else{
	say 'NOT TRUE ' , $a , ' ne ' ,  $b;
}
if ($b ne $a){ # returns 1
	say 'TRUE ' , $b , ' ne ' ,  $a;
}
else{
	say 'NOT TRUE ' , $b , ' ne ' ,  $a;
}
if ($a ne $a){ # returns 0
	say 'TRUE ' , $a , ' ne ' ,  $a;
}
else{
	say 'NOT TRUE ' , $a , ' ne ' ,  $a;
}
say "\n";
##################
say "lt";
if ($a lt $b){ ## returns 1
	say 'TRUE ' , $a , ' lt ' ,  $b;
}
else{
	say 'NOT TRUE ' , $a , ' lt ' ,  $b;
}
if ($b lt $a){ # returns 0
	say 'TRUE ' , $b , ' lt ' ,  $a;
}
else{
	say 'NOT TRUE ' , $b , ' lt ' ,  $a;
}
if ($a lt $a){ # returns 0
	say 'TRUE ' , $a , ' lt ' ,  $a;
}
else{
	say 'NOT TRUE ' , $a , ' lt ' ,  $a;
}
say "\n";
##################
say "le";
if ($a le $b){ ## returns 1
	say 'TRUE ' , $a , ' le ' ,  $b;
}
else{
	say 'NOT TRUE ' , $a , ' le ' ,  $b;
}
if ($b le $a){ # returns 0
	say 'TRUE ' , $b , ' le ' ,  $a;
}
else{
	say 'NOT TRUE ' , $b , ' le ' ,  $a;
}
if ($a le $a){ # returns 1
	say 'TRUE ' , $a , ' le ' ,  $a;
}
else{
	say 'NOT TRUE ' , $a , ' le ' ,  $a;
}
say "\n";
##################
say "gt";
if ($a gt $b){ ## returns 0
	say 'TRUE ' , $a , ' gt ' ,  $b;
}
else{
	say 'NOT TRUE ' , $a , ' gt ' ,  $b;
}
if ($b gt $a){ # returns 1
	say 'TRUE ' , $b , ' gt ' ,  $a;
}
else{
	say 'NOT TRUE ' , $b , ' gt ' ,  $a;
}
if ($a gt $a){ # returns 0
	say 'TRUE ' , $a , ' gt ' ,  $a;
}
else{
	say 'NOT TRUE ' , $a , ' gt ' ,  $a;
}
say "\n";
##################
say "ge";
if ($a ge $b){ ## returns 0
	say 'TRUE ' , $a , ' ge ' ,  $b;
}
else{
	say 'NOT TRUE ' , $a , ' ge ' ,  $b;
}
if ($b ge $a){ # returns 1
	say 'TRUE ' , $b , ' ge ' ,  $a;
}
else{
	say 'NOT TRUE ' , $b , ' ge ' ,  $a;
}
if ($a ge $a){ # returns 1
	say 'TRUE ' , $a , ' ge ' ,  $a;
}
else{
	say 'NOT TRUE ' , $a , ' ge ' ,  $a;
}
say "\n";

