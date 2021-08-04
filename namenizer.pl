#system('mkdir elmerHomero');
$master="/home/roberto/microa_feb/microarreglo/YOMWG_10_02/YOMWG_10_02.txt";	#cambiale aki antes de correrlo!!!!
open(MASTER, $master)or die "el archivo maestro no fue correctamente abierto\n";
@yom=<MASTER>;
print"before chomp\n";
chomp(@yom);
print "after chomp\n";
close(MASTER);
@avidemus=split("\t",$yom[32]);
print"$avidemus[5] : $avidemus[7]\n\n";
foreach $fi(@ARGV){
#	@nombre=split(".",$fi);
	open(ARCHI, $fi)or die"Can not open $fi\n";
	@actual=<ARCHI>;
	chomp(@actual);
	close(ARCHI);
#	$outs="> ".$nombre[0]."dep.".$nombre[1];
#	open(OUT,$outs);
	foreach $orf(@actual){
		$orfin=lc($orf);
		#print"$orfin\t:";
		foreach $genma(@yom){
			@gen=split("\t",$genma);
		#	print"$orfin : $gen[5]\n";
			if($gen[5].' ' eq $orfin){
				print"$orfin : $gen[7]\n";
				last;
			}
		}
	}
	
}
close(OUT);
#checar si si corre
