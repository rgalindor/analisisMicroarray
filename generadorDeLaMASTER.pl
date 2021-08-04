if((scalar(@ARGV))!=2){
print scalar(@ARGV);
print"modo de uso:\nperl blablabla.pl <archivo master> <matriz de busqueda>\n";
}
else{
#primero se pasa la lista buena de genes de sacharommyces
open(LISTA, $ARGV[0])or die "desde el primero, no te da verguenza?\n";
@lista=<LISTA>;
close(LISTA);
##luego se pasa la matriz en la que se desee hacer el análisis
open(MATRIZ, $ARGV[1])or die "no se pudo mijo\n";
@mx=<MATRIZ>;
close(MATRIZ);
chomp(@mx);
chomp(@lista);
@genes=split(";",$mx[0]);
for($i=0;$i<scalar(@genes);$i++){
	$gen=uc($genes[$i]);
	$esta=0;
	for($j=0;$j<scalar(@lista);$j++){
		$help=uc($lista[$j]);
		if($help=~/\t$gen/){
			$esta=1;
			$help=~/(S\d+)\t/ ;
			$final{$genes[$i]}=$1;
			last;	
		}
	}
	if($esta==0){
		print "Hay pedos con $genes[$i]\n";
	}
}
print "\n=======\n";
open(OUT, ">tablaIDs.txt");
foreach $dato(keys(%final)){
	print OUT "$dato\t$final{$dato}\n";
}
}
close(OUT);


