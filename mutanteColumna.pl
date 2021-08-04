#!perl 
use Getopt::Long;
my %opts = ();
GetOptions(\%opts,'c=s', 'i=s', 'p=i', 'r=s', 'o=s', 'g=s', 'n=s', 'h', 'v', 'f=i');
if(($opts{'h'})||(scalar(keys(%opts))==0)||(!$opts{'c'})||(!$opts{'i'})){
my $os=$^O;
print"Running in: $os\n";
print <<HELP;
NAME
        version2discriminante.pl

PARAMETTERS 

	-c Colection file name.   *obligatory

	-i Grow analysis system output, a text file with x0D as line 
	   separator.(INPUT)      *obligatory

	-p Plate to analize.

	-r Plate row to start analysis.

	-h Display this.

	-n Cut point proportion n*(mean(positive control ,negative control))
	   default 1.

	-o Output name.(OUTPUT)  

	-g Graphic name(OUTPUT)

	-v verbose

	-f Format to export plots, default pdf.
	   0 for pdf
	   1 for bmp
	   2 for jpeg
	   3 for png
	   4 for tiff


AUTHOR
        Roberto Galindo Ramirez
        LCG 4a Generacion
        Instituto de Fisiologia Celular
        Ciudad Universitaria UNAM

DESCRIPTION
        Takes the results from grow analysis system and obtains yeastgenome's 
        description.
        This program call to version2graficante.R in order to discriminate and 
        make graphics about strains which grow at experiment to measure.
        
        
INPUT
       Strains should be at this order into the plates:
       
       
            PROBE 1         PROBE 2    CONTROL
cols   A|C|E|G B|D|F|H A|C|E|G B|D|F|H
       01  11  21  31  41  51  61  71  81  91
       *   *   *   *   *   *   *   *   
       *   *   *   *   *   *   *   *   +
       *       *       *       *       *
       *       *       *       *       *
       *       *       *       *       -
       *       *       *       *
       *       *       *       *
       *       *       *       *
       *       *       *       *
       *       *       *       *

       
       
EXAMPLE
  perl version2discriminante.pl -c colecciona.txt -i Libro1.txt -p 1 -r A -o bambi.out -g graph
  perl version2discriminante.pl -c directory/colecciona.txt -i placa2a1b12rep.txt -n 0.75 
	
        
FORMAT 
        Output graphical files with the graphical view of grow.
	If there is almost one strain with meanly grow write into a plain text
	file strain names as a list.

HELP
}
else{
	$fname=$opts{'i'};
	print"\nEscribe los nombres de los mutantes por columna,\nen caso de no haber mutante solo da enter\n\n";
	$tname=substr($fname,0,length($fname)-4);
	open(FI, $fname);
	@fi=<FI>;
	close(FI);
	@headers=split(",",$fi[0]);
	$mutante[0]="Tiempo";
	for($i=1; $i<scalar(@headers); $i++){
		print"Cual es la mutante de la columna $i ?\n";
		$mutantes[i]=<STDIN>;
	}
	print"\n";
	$mut[0]=join(",",@mutantes);			
	shift(@fi);
	unshift(@mut,@fi);
	$impr=join("\n",@fi);		###Aqui no ponemos el ultimo enter del archivo, causara problemas??   NOOO
	open(TMP, '>'.$tname.'.csv');
	print TMP "$impr\n";
	close(TMP);
	
	
}
