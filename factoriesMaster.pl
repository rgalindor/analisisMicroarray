$comando='R --save < "/home/roberto/Dropbox/Labo/analisisMicroArray/genAriseRobCARPET.R"';
$comando='perl /home/roberto/Dropbox/Labo/analisisMicroArray/filtradorIDs.pl *p';
opendir(OD,".");
@datos=readdir(OD);
close(OD);
for($i=0;$i<scalar(@datos);$i++){
	if($datos[$i] =~ /GOOD/){
	}
}
system($comando);
