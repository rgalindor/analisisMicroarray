
open(LISTA,$ARGV[0])or die "No mams\n";
@list=<LISTA>;
close(LISTA);
chomp(@list);
@tf=();
@reg=();
foreach $rel(@list){
	$rel=~/(\w+)\t(\w+)/;
	$ftf=&busqueda($1, \@tf);
	if($ftf==1){
		$rel{$1}{$2}=1;
	}
	else{
		push(@tf,$1);
		$rel{$1}{$2}=1;
	}
	$fgen=&busqueda($2, \@reg);
	if($fgen==0){
		push(@reg, $2);
	}
}
#for sobre los tfs {for sobre los genes{ suma las relaciones}}
for($i=0;$i<scalar(@tf);$i++){
	print"\n$tf[$i] regula a:\n";
	for($j=0;$j<scalar(@reg);$j++){
		if($rel{$tf[$i]}{$reg[$j]}){
		print"$reg[$j]\n";}
	}
}
###########################
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
#print"$tf[1]\n";
