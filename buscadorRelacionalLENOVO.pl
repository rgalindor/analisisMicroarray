if((scalar(@ARGV))!=2){
print scalar(@ARGV);
print"modo de uso:\nperl buscadorRelacional.pl <lista de genes> <matriz de busqueda>\n";
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
open(TRA,"/home/rgalindo/Dropbox/Labo/analisisMicroArray/tablaIDs.txt")or die"la que no se abrio es la lista con dualidad de IDs\n";
@tra=<TRA>;
close(TRA);
chomp(@lista);
chomp(@tra);
chomp(@mx);
for($i=0;$i<scalar(@tra);$i++){
	@k=split("\t",$tra[$i]);
	$tabla{$k[0]}=$k[1];
}
###vemos cuales genes de nuestra lista estan en la tabla chidongonga
@genes=split(";",$mx[0]);
@jindices=();
@iindices=();
for($i=0;$i<scalar(@lista);$i++){
	for($j=0;$j<scalar(@genes);$j++){
		if($lista[$i] eq $tabla{$genes[$j]}){
			push(@jindices, $j);
			push(@iindices, $i);
			$lista[$i]=$genes[$j];
			last;
		}
	}
}
#se prepara el output
$output='>'.$ARGV[0];
$output=~s/\./_/;
$output.="READYout.csv";
open(OUT, $output);
$help=$lista[$iindices[0]];
$helpy=$tabla{$lista[$iindices[0]]};
for($i=1;$i<scalar(@iindices);$i++){
	$help.=';'.$lista[$iindices[$i]];
	$helpy.="\n".$tabla{$lista[$iindices[$i]]};
}
#$o2=$output.'1';
#open(TUO, $o2);
#print TUO $helpy;
#print "\n";
#close(TUO);
#generación del output
print OUT $help;
print OUT "\n";
#print $help;
#print "\n";
for($i=1;$i<scalar(@mx);$i++){
	@renglon=split(";",$mx[$i]);
	print OUT $renglon[0];
	print $renglon[0];
	for($j=0;$j<scalar(@jindices);$j++){
		$help=';'.$renglon[$jindices[$j]+1];
		print OUT $help;
	#	print $help;
	}
	print OUT "\n";
	#print "\n";
}
}
