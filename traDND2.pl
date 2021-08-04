open(FI,$ARGV[0])or die "no hay archivo\n";
@fi=<FI>;
close(FI);
#@nu=();
#@pesos=();
#@posi=(0);
#$fi[0]=~/h\s=\s(\d+\.\d+|\d+)/;
#$rama{0}=$1;
#print"$rama{0}\n";
#print"(";
#for($j=1;$j<scalar(@fi);$j++){
#	$lin=$fi[$j];
#}


$fi[0]=~/h\s=\s(\d+\.\d+|\d+)/;
$valor=$1;
&abreDEN($valor, 0, $valor*2);
sub abreDEN{
	print"(";
	my ($longitud, $algo, $longp)=@_;
#	print"$$algo ?? $aver ?? $algo";

	if ($fi[$algo+1] =~ /leaf/){
		&hoja1($longitud, $algo+1, $longp);
	}elsif($fi[$algo+1] =~ /dendrogram/){
		$fi[$algo]=~/h\s=\s(\d+\.\d+|\d+)/;
		$long=$1;
		&abreDEN($long, $algo+1, $longitud);
	}
}
sub hoja1{
	my ($longitud, $algo, $longp)=@_;
	$fi[$algo]=~/\s.(\w+)/;
	$help=$1.':'.$longitud.',';
	print"$help";
	if ($fi[$algo+1] =~ /dendrogram/){
		$fi[$algo]=~/h\s=\s(\d+\.\d+|\d+)/;
		$long=$1;
		&abreDEN($long, $algo+1, $longitud);
	}
	elsif($fi[$algo+1] =~ /leaf/){
		&hoja2($longitud, $algo+1, $longp);
	}
}
sub hoja2{
	my ($longitud, $algo, $longp)=@_;
	#se printea  el cierre del dedrogram, con su valor y todo
	$fi[$algo]=~/\s.(\w+)/;
	$help=$1.':'.$longitud.'):'.$longp;
	if($fi[$algo+1] =~ /dedrogram/){
		$fi[$algo]=~/h\s=\s(\d+\.\d+|\d+)/;
		$long=$1;
		&abreDEN($long, $algo+1, $longitud);
	}
	elsif($fi[$algo+1] =~ /leaf/){
		print",";
		&hoja2($longitud, $algo+1, $longp);
	}
}
sub posisi_{
	my($lin)=@_;
	$lugar="--";
	@cadena=split("",$lin);
	for($i=0,$ip=0;$i<scalar(@cadena)-1;$i+=3,$ip++){
		$help=$cadena[$i].$cadena[$i+1];
		if($help eq $lugar){
			$pos=$ip;
			last;
		}
	}
	return($pos);
}
