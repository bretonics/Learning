#!/usr/bin/perl
use warnings;
use strict;
use feature qw(say);


my @days = qw(Monday Tuesday Wednesday Thursday Friday Saturday Sunday); 
my %french = (
        apple  => "pomme",
        pear   => "poivre",
        orange => "Leon Brocard"
);

my $size = @days;
say "The for Loop";
say "start \$i = 0";
for(my $i = 0; $i < $size; $i++){
        say "Day " , $i , " = " , $days[$i];
}

say "\nstart \$i = 1";
for(my $i = 1; $i <= $size; $i++){
        say "Day " , $i , " = " , $days[$i-1];
}

#=cut
say "\nThe foreach Loop";
##say out an array
say "print out the array";
foreach my $day (@days){
	say "here is the" ,  $day;
}
##say out a hash
say "\nThe foreach Loop";
say "print out the hash";
foreach my $word (keys %french){
	say "here is the " , $word , " and the value = " , $french{$word};
}
say "\nThe while Loop";
my $i = 0;
while ($days[$i]){
        say "printing out the days " , $days[$i];
        $i++;
}


say "\nThe until Loop";
$i = 0;
until($i >= $size){
        say "printing out the days " , $days[$i];
        $i++;
}
