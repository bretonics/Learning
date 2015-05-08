#! /usr/bin/perl
use strict;
use warnings;
use diagnostics;
use feature qw(say);

my $genbankFileData;
my $accession;
my $gene;
my $dna;
my $proteinSeq;
my $organism;
my $cds;
my $translTable;


my $infile = $ARGV[0];
unless (open(INFILE, "<", $infile) ){
	die "Can't open ", $infile , " for reading " , $!;
}
##get the entire file in the variable
$/ = ''; #line separator
$genbankFileData = <INFILE>;
$/ = "\n";  #setting back line separator
close INFILE;

$accession 	= getAccession($genbankFileData);
$gene 		= getGene($genbankFileData);
$dna 		= getDnaSequence($genbankFileData);
$proteinSeq = getProteinSequence($genbankFileData);
$organism 	= getOrganism($genbankFileData);
$cds		= getCDS($genbankFileData);
$translTable = getTranslTable($genbankFileData);

printResults($accession, "Accession");
printResults($gene, "Gene");
printResults($dna, "Dna");
printResults($proteinSeq, "Protein");
printResults($organism, "Organism");
printResults($cds, "CDS");
printResults($translTable, "Translation Table");

sub getAccession{
	my ($gbFile) = @_;
	#if($gbFile=~/ACCESSION\s*(\w+)/){  #note how both of these will work!  take a look at m modifier
	if($gbFile=~/^ACCESSION\s*(\w+)/m){
		return $1;
	}else{
		return 'error';
	}
}
sub getDnaSequence{
	my ($gbFile) = @_;
	my $seq;
	if($gbFile=~/ORIGIN\s*(.*)\/\//s){
		$seq = $1;
	}
	else{
		return "error";
	}
	#remove spaces and numbers from the sequence
	$seq =~ s/[\s\d]//g;
	return uc($seq);
}
sub getGene {
	my ($gbFile) = @_;
	if($gbFile=~/gene="(.*?)"/s){
		return $1;
	}
	else{
		return 'unknown';
	}
}
sub getOrganism {
	my ($gbFile) = @_;
	if($gbFile=~/organism="(.*?)"/s){
		return $1;
	}
	else{
		return 'unknown';
	}
}
sub getProteinSequence {
	my ($gbFile) = @_;
	my $pro;
	if($gbFile=~/translation="(.*?)"/s){
		$pro = $1;
	}
	else{
		return "unknown";
	}
	#remove spaces from the sequence
	$pro =~ s/\s//g;
	return uc($pro);
}
sub getCDS {
	my ($gbFile) = @_;
	my $i = 0;
	while ($gbFile =~ /(CDS)/g) {
		$i++;
	}
	return $i;
}
sub getTranslTable {
	my  ($gbFile) = @_;
	my @results = ($gbFile =~ /transl_table=(\d*)\s+/g);
	my $arrayLen = @results;
	for (my $i = 1; $i < $arrayLen; $i++) {
		my $j = 0;
		my $result1 = $results[$j];
		my $result2 = $results[$i];
		if ($result1 != $result2) {
		 return "Not the same translation tables";
		}
		$j++;
	}
	return "Trable $1 was used for all genes";
}
sub printResults {
	my ($results, $type) = @_;
	say $type , ": ",  $results;
}