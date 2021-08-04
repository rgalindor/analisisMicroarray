$comando='R --save < "/home/roberto/Dropbox/Labo/analisisMicroArray/genAriseRobCARPET.R"';system($comando);
$comando='perl /home/roberto/Dropbox/Labo/analisisMicroArray/filtradorIDs.pl *p';system($comando);
opendir(OD,".");
@datos=readdir(OD);
close(OD);
for($i=0;$i<scalar(@datos);$i++){
	if($datos[$i] =~ /GOOD/){		$comando='perl /home/roberto/Dropbox/Labo/analisisMicroArray/buscadorRelacional.pl '.$datos[$i].' '.$ARGV[0];		system($comando);
	}
}$comando='R --save < "/home/roberto/Dropbox/Labo/analisisMicroArray/carpetDendroFactories.R"';
system($comando);

