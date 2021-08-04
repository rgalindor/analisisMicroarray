open(FI, $ARGV[1])or die"no se pudo abrir $ARGV[1]\n";
@fi=<FI>;
close(FI);
foreach $li(@fi){
	$li=~s/$ARGV[0]//;
	print $li;
}
###se necesita poner un \ para escapar cada \ que se ponga, si se quiere buscar el patron algo\t, se debe hacer asi: perl eliminaPattern.pl algo\\t archivo.txt
