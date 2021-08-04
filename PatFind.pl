#!perl -w
foreach $este(@ARGV){
	print "File $este \n";
	for($i=65;$i<81;$i++){
		$char= sprintf("%c",$i);
		$seq='Y'.$char.'R';
		print "$seq :\t";
		$com="cat ".$este."| grep Y".$char."R | wc -l";
		system($com);
		$seq='Y'.$char.'L';
		print "$seq :\t";
		$com="cat ".$este."| grep Y".$char."L | wc -l";
		system($com);

	}
	print"\n";
}
##programa que cuenta la cantidad de entradas por cada cromosoma en un archivo que tenga nombres sistematicos de sacharomyces cerevissiae
