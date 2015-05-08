#!/usr/bin/perl
use warnings;
use strict;
use feature qw(say);

##just some Perl printing caveats
say "output 1";
##interpolation
my $apples = 4;
say "I have " ,  $apples , " apples";
say "I have $apples apples";
say "\n";

say "output 2";
say "I \"have\" " , $apples,  " apples";
say "\n";

##what if you have a block of stuff to print
##Use a 'Here docment'
say "output 3";
my $oranges = 7;
my $pears = 3;
print <<"EOF";
My fruit list:
$apples apples
$oranges oranges
$pears pears
EOF
say "\n";

##Non-interpoloated string
say "output 4";
print 'Those strawberries cost $2.50';
say "\n\n";

##Block of code with Non-interpolated strings
say "output 5";
print <<'EOF';
My fruit list:
$apples apples
$oranges oranges
$pears pears
EOF
say "\n";

=cut
Sometimes you will find that you do need to use either backslashes. 
For example, if you want to print a dollar sign and then an amount in a 
variable, you could use either: 
=cut

say "output 6, strange cases";
my $amount = 40.00;
#use the list print command
say 'The amount is $' , 
			$amount;
#say you can put mulpile lines into one print statement
say "The amount " ,
			"\$" , $amount;
