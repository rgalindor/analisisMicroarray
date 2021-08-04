for($k=0;$k<scalar(@ARGV);$k++){
open(ARC,$ARGV[$k])or die"chales mijo\n";
@fi=<ARC>;
close(ARC);
chomp(@fi);
@buenos=();
for($i=0;$i<scalar(@fi);$i++){
	if($fi[$i] =~ /S\d+/){
		$fi[$i] =~ /(S\d+)/;
		push(@buenos,$1);
	}
}
$out=$ARGV[$k];
$ext="";
$caracter="";
while($caracter ne "."){
$caracter=chop($out);
$ext.=$caracter;
}
@he=split("",$ext);
$ext="";
for($i=scalar(@he)-1;$i>=0;$i--){
	$ext.=$he[$i]
}
$out=">".$out."GOOD".$ext;
print $out;
open(OUT,$out);
for($i=0;$i<scalar(@buenos);$i++){
	print OUT $buenos[$i];
	print OUT "\n";
}
close(OUT);
}