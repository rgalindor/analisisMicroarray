open(PRIM,$ARGV[0])or die"No se abrio el  primer archivo\n";@prim=<PRIM>;
chomp(@prim);close(PRIM);
@news=();foreach $va(@ARGV){	open(VAR, $va) or die "Error al abrir $va";	@nuevo=<VAR>;	close(VAR);	foreach $gen1(@nuevo){		chomp($gen1);
		$gen1=~s/ //;
		$bandera=&busqueda($gen1, \@prim);		if($bandera==0){
			push(@news, $gen1);
		}
	}}foreach $r(@news){	print"$r\n";}sub busqueda{
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

