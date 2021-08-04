#!perl -w
open(COMP,$ARGV[0])or die"no hay primer archivo\n";
@comp=<COMP>;
chomp(@comp);
close(COMP);
@tmp=();
for($i=1;$i<scalar(@ARGV);$i++){
	open(NUEVO, $ARGV[$i])or die"no se abrio $ARGV[$i] \n";
	@new=<NUEVO>;
	chomp(@new);
	close(NUEVO);
	foreach $gen(@comp){
		$simon=busqueda($gen,\@new);
		$tempi=busqueda($gen,\@tmp);
		if(($simon==1)&&($tempi==0)){
			push(@tmp,$gen);
		}
	}
}
foreach $gen(@tmp){
	print"$gen\n";
}


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
#####Programa que busca de un primer archivo todos los que esten en una lista de archivos, quita repetidos.
