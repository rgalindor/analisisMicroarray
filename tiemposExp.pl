#!perl -w

open(UNO, $ARGV[0]) or die "No existen archivos para abrir\n";
@genes=<UNO>;
chomp(@genes);
close(UNO);

for($i=1;$i<scalar(@ARGV);$i++){
	@nuevos=NULL;
	open(NUE,$ARGV[$i]) or die "Error al cargar $ARGV[$i]\n"; 
	@nuevos=<NUE>;
	chomp(@nuevos);
	close(NUE);
	foreach $gen (@nuevos){
		$bandera=busqueda($gen, \@genes);
		if($bandera==0){
			push(@genes, $gen);
		}
	}
}

###NOMbres de archivos
my @rep;
my @exp;
foreach $nam(@ARGV){
	
	if($nam=~/exp/){

		push(@exp,$nam);
	}
	else{
		push(@rep,$nam);
	}
}

foreach $gen (@genes){
	for($i=0;$i<scalar(@exp);$i++){
		@busq=NULL;
		open(BUSQ,$exp[$i]) or die "Error al cargar $exp[$i]\n";
		@busq=<BUSQ>;
		close(BUSQ);
		
		@ueda=NULL;
		open(UEDA,$rep[$i]) or die "Error al cargar $rep[$i]\n";
		@ueda=<UEDA>;
		close(UEDA);
		chomp(@busq);
		chomp(@ueda);
		$estax=busqueda($gen, \@busq);
		$estar=busqueda($gen, \@ueda);
		if($estax==1){
			$expr{$gen}[$i] = 1;
		}
		elsif($estar==1){
			$expr{$gen}[$i] = -1;
		}
		else{
			$expr{$gen}[$i] = 0;
		}
	}
}
#system('mkdir ../palbnf');
#open(OUT, "> ../palbnf/tiempos.txt");
#print OUT "\tEXP0:0\tEXP0:1\tEXP0:2\EXP0:3\n";
for($j=0;$j<scalar(@genes);$j++){
#	print OUT "$genes[$j]\t";
	print"$genes[$j]\t";
	for($i=0;$i<4;$i++){
		print"$expr{$genes[$j]}[$i]\t";
#		print OUT "$expr{$genes[$j]}[$i]\t";
	}
	print"\n";
#	print OUT "\n";
}
#close(OUT);
###############FUNCIONES############################
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

