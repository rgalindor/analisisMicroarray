open(UNO,$ARGV[0]);
@lista=<UNO>;
close(UNO);
open(DOS,$ARGV[1]);
@ids=<DOS>;
close(DOS);
chomp(@lista);
chomp(@ids);
$out='>good'.$ARGV[0];
open(OUT,$out);
for($i=0;$i<scalar(@lista);$i++){
	for($j=0;$j<scalar(@ids);$j++){
		@ren=split("\t",$ids[$j]);
		if($ren[0] eq $lista[$i]){
			print OUT $ren[1];
			print OUT "\n";
		}
	}
}
close(OUT);
