open(ARCHI, $ARGV[0])or die "no se puede abrir $ARGV[0]\n";
@archi=<ARCHI>;
chomp(@archi);
close(ARCHI);
@limpio=();
foreach $linea(@archi){
	$bandera=&busqueda($linea, \@limpio);
	if($bandera==0){
		push(@limpio,$linea);
	}
}
foreach $r(@limpio){	print"$r\n";}
sub busqueda{
my ($buscado, $donde)=@_;
	$flag=0;
	foreach $este(@$donde){
		if($buscado eq $este){
			$flag=1;
			last;
		}
	}
	return $flag;
}
###LIMPIADOR
