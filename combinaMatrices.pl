open(UNO,$ARGV[0])or die "No mams error en $ARGV[0]\n";
@uno=<UNO>;
close(UNO);
open(DOS,$ARGV[1])or die "No mams error en $ARGV[1]\n";
@dos=<DOS>;
close(DOS);
chomp(@uno);
chomp(@dos);
@genes1=split(";",$uno[0]);
shift(@genes1);
@genes2=split(";",$dos[0]);
shift(@genes2);
@tf=();
for($i=1;$i<scalar(@uno);$i++){
	@help=split(";",$uno[$i]);
	for($j=0;$j<scalar(@genes1);$j++){
		$tabla1{$help[0]}{$genes1[$j]}=$help[$j+1];
	}
	push(@tf,$help[0]);
}

for($i=1;$i<scalar(@dos);$i++){
	@help=split(";",$dos[$i]);
	for($j=0;$j<scalar(@genes2);$j++){
		$tabla2{$help[0]}{$genes2[$j]}=$help[$j+1];
	}
	$esta=0;
	for($j=0;$j<scalar(@tf);$j++){
		if($help[0] eq $tf[$j]){
			$esta=1;
			last;
		}
	}
	if($esta==0){
		push(@tf,$help[0]);
	}
}
@todos=@genes1;
for($i=0;$i<scalar(@genes2);$i++){
	$esta=0;
	for($j=0;$j<scalar(@genes1);$j++){
		if($genes2[$i] eq $genes1[$j]){
			$esta=1;
			last;
		}
	}
	if($esta==0){
		push(@todos,$genes2[$i]);
	}
}
#print "\$tabla2{$tf[0]}{$todos[3]} = $tabla2{$tf[0]}{$todos[3]}\n";
#print "\$tabla1{$tf[0]}{$todos[3]} = $tabla1{$tf[0]}{$todos[3]}\n";
print scalar(@todos);
for($i=0;$i<scalar(@todos);$i++){
	print";$todos[$i]";
}
print"\n";
#print scalar(@tf);
#print"\t";
#print scalar(@todos);

for($i=0;$i<scalar(@tf);$i++){
	print $tf[$i];
	for($j=0;$j<scalar(@todos);$j++){
		if(!defined($tabla1{$tf[$i]}{$todos[$j]})){
			if(!defined($tabla2{$tf[$i]}{$todos[$j]})){
				#die"chales :  TF $tf[$i] i = $i ... GEN $todos[$j] j = $j\n\$tabla2{$tf[$i]}{$todos[$j]} = $tabla2{$tf[$i]}{$todos[$j]}\n\$tabla1{$tf[$i]}{$todos[$j]} = $tabla1{$tf[$i]}{$todos[$j]}\n";
				print";0";
			}
			else{
				print";$tabla2{$tf[$i]}{$todos[$j]}";
			}
		}
		elsif(!defined($tabla2{$tf[$i]}{$todos[$j]})){
			print";$tabla1{$tf[$i]}{$todos[$j]}";
		}
		else{
			if(($tabla1{$tf[$i]}{$todos[$j]}==0)&&($tabla2{$tf[$i]}{$todos[$j]}==0)){
				print";0";
			}
			else{
				print";1";
			}
		}
	}
	print"\n";
}

