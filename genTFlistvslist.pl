open(FILE, $ARGV[0])or die"ya valio\n";
@archi=<FILE>;
close(FILE);
chomp(@archi);
open(FILE, $ARGV[1])or die"ya valio1\n";
@archi2=<FILE>;
close(FILE);
chomp(@archi2);
@tf=();
@gen=();
for($i=0; $i<scalar(@archi); $i++){
	@edge=split("\t",$archi[$i]);
#	push(@tf, $edge[0]);
	push(@gen, $edge[1]);
}
for($i=0; $i<scalar(@archi2); $i++){
	@edge=split("\t",$archi2[$i]);
	push(@tf, $edge[0]);
#	push(@gen, $edge[1]);
}
@buenos=();
for($i=0; $i<scalar(@gen); $i++){
	$band=&busqueda($gen[$i], \@tf);
	if($band==1){
		#print"$tf[$i] -> $gen[$i]\n";
		$flag=&busqueda($gen[$i], \@buenos);
		if($flag==0){
			push(@buenos, $gen[$i]);
		}
	}
}
for($i=0; $i<scalar(@buenos); $i++){
	print"$buenos[$i]\n";
}
#$bandera=&busqueda($gen1, \@prim);
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

