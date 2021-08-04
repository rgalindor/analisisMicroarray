#$chale="valemais	jitomate jiod			chuntaro	algo";
#5 tabs
#@cholo=split("\t",$chale);
#print"algo == $cholo[5]\n";
$path="/home/roberto/relacionalYEASTnames.tab";
open(FILE, $ARGV[0])or die"ya valio\n";
@archi=<FILE>;
close(FILE);
chomp(@archi);
open(REL, $path)or die"ya valio 2\n";
@rela=<REL>;
close(REL);
chomp(@rela);

for($i=0; $i<scalar(@archi); $i++){
	@edge=split("\t",$archi[$i]);
	$orf=uc($edge[1]);
	for($j=0; $j<scalar(@rela); $j++){
		@des=split("\t",$rela[$j]);
		if($des[5] eq $orf){
			$reg=uc($edge[0]);
			print"$reg\t$des[0]\n";
		}
	}
}
