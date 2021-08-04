
	@father=();
	@child=();

for($i=0;$i<scalar(@ARGV);$i++){
	open(RED, $ARGV[$i])or die,"no hay red\n";
	@red=<RED>;
	chomp(@red);
	close(RED);
	@padres=();
	@hijos=();
	foreach $edge(@red){
		@con=split("\t", $edge);
		push(@padres,$con[0]);
		push(@hijos,$con[1]);
	}

	foreach $dat(@padres){
		$bandera=&busqueda($dat, \@father);
		if($bandera==0){
			push(@father,$dat);
		}
	}
	foreach $dat(@hijos){
		$bandera=&busqueda($dat, \@child);
		if($bandera==0){
			push(@child,$dat);
		}
	}
	
	for($j=0;$j<scalar(@father);$j++){
		$k=0;
		foreach $dat(@padres){
			if($dat eq $father[$j]){
				$k+=1;
			}
		}
		$ngenes{$father[$j]}{$i}=$k;
	}
}
#####lo de abajo es para solo un archivo ordenarlo e imprimirlo
#foreach $dat(sort{$ngenes{$a} <=> $ngenes{$b}} sort keys %ngenes){
#	print"$dat\t$ngenes{$dat}\n";
#}
######
open(OUT,">filtros/cosa.txt");
foreach $cosa(%ngenes){
	if(!$ngenes{$cosa}{0}){
		$ngenes{$cosa}{0}=0;
	}
	if(!$ngenes{$cosa}{1}){
		$ngenes{$cosa}{1}=0;
	}
	if(!$ngenes{$cosa}{2}){
		$ngenes{$cosa}{2}=0;
	}
	if(!$ngenes{$cosa}{3}){
		$ngenes{$cosa}{3}=0;
	}
	print OUT "$cosa\n";
	print"$cosa\t$ngenes{$cosa}{0}\t$ngenes{$cosa}{1}\t$ngenes{$cosa}{2}\t$ngenes{$cosa}{3}\n";
}
close(OUT);

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

