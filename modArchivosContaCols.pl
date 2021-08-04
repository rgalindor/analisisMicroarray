open(ARCHI, $ARGV[0]) or die "chales\n";
@ar=<ARCHI>;
close(ARCHI);
@cols=split(";",$ar[0]);
open(NIU, '>'.$ARGV[1]);
print NIU $ar[0];
for($i=1;$i<scalar(@ar);$i++){
	@act=split(";",$ar[$i]);
	if(scalar(@act) == scalar(@cols)){
		print NIU $ar[$i];
		print "$act[0]   $i\n";
	}
	else{
		print"Se ha borrado la linea $i por no tener un numero de columnas adecuado\n";
	}
}

