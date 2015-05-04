#!/usr/bin/perl
use warnings;
use strict;
use feature qw(say);
#=cut
my @days;
#@days = ("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday");
#my @days = qw(Monday Tuesday Wednesday Thursday Friday Saturday Sunday); 
$days[0] = "Monday";
$days[1] = "Tuesday";
$days[2] = "Wednesday";
$days[3] = "Thursday";
$days[4] = "Friday";
$days[5] = "Saturday";
$days[6] = "Sunday"; 

say "The 1st mystery value is " , $days[-4] , "\n";

my $i = 2;

say "The 2nd mystery value is " , $days[$i] , "\n";

#=cut
#If you want to assign the first value of an array into a scalar, the script would be :
my ($result) = @days; 
say "The 3rd mystery value  is " , $result , "\n";


#To assign the first two elements of an array into scalar values
my ($result1,$result2) = @days;
say "The 4rd mystery values are " , $result1 , " and " , 
		$result2 , "\n";

#find the length of the array
$result = @days;
say "The 5th mystery value is " , $result , "\n";

#copy arrays
my @days2 = @days;
say "@days2\n";


#=cut

##add to beginning of an array
my $scalar = "NewDay";
unshift(@days, $scalar);
@days2 = ($scalar, @days2);
say "new day added to the beginning = @days";
say "new day added to the beginning = @days2\n";

#add to the end of an array
push @days, $scalar;
@days2 = (@days2, $scalar);
say "new day added to the beginning = @days";
say "new day added to the beginning = @days2\n";

##Remove the first element
my $scalar2 = shift @days;
#Remove the last element
$scalar2 = pop @days2;
say "Removed the first element in \@days @days";
say "Removed the last element in \@days2 @days2\n";

#Combine arrays
my @days3;
@days3 = (@days, @days2);
say "New array @days3";
