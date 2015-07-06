#!/usr/bin/perl

use warnings;
use strict;

sub lastFirst {
	my ($first, $last) = @_;
	my $lastNameLength = length($last);
	print $lastNameLength, "\t", $last, ", ", $first,"\n";
}

lastFirst("Andres", "Breton");
lastFirst("Alexandra", "Arias");
lastFirst("Chuck", "Russo");

#print $lastNameLength;
