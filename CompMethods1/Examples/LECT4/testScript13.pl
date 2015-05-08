#!/usr/bin/perl
use warnings;
use strict;
use feature qw(say);

my @days = qw(Monday Tuesday Wednesday Thursday Friday Saturday Sunday); 

foreach my $day (@days){
	if ($day eq 'Monday'){
		say "Today is " , $day;
	}
	elsif ($day eq 'Tuesday'){
		say "Today is " , $day;
	}
	elsif ($day eq 'Wednesday'){
		say "Today is " , $day;
	}
	else{
		say "Today (" , $day , ") is not a Monday, Tuesday or Wednesday";
	}
}

#To avoid the repetitive code I could do this:
say "\n\n\n";
foreach my $day (@days) {
	if ($day eq 'Monday'  || 
   	    $day eq 'Tuesday' || 
	    $day eq 'Wednesday' ) {
      		say "Today is " , $day;
	}
  	else{
      		say "Today (" , $day , ") is not a Monday, Tuesday or Wednesday";
    	}
}
