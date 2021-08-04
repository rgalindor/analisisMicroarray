open(MASTER, "/home/roberto/relacionalYEASTnames.tab")or die"NO abri el archivo relacional\n";
@mas=<MASTER>;
close(MASTER);
chomp(@mas);
open(NOMBRES, $ARGV[0]) or die "No se abrio el archivo de nombres\n";
@prueba=<NOMBRES>;
close(NOMBRES);
chomp(@prueba);
foreach $genpr(@prueba){
	$genpr=uc($genpr);
	foreach $genma(@mas){
		@arr=split("\t", $genma);
		for($i=0;$i<scalar(@arr);$i++){
			if($arr[$i] eq $genpr){
				#print"$arr[$i] : ";
				for($j=$i;$j<scalar(@arr);$j++){
					if($arr[$j]=~/Y\w(R|L)\d\d\d(C|W)/){
						$arr[$j]=~/(Y\w\w\d\d\d\w)/;
						print"$1\n";
					}
				}
			}
		}
	}
}

