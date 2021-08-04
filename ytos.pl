#!perl

open(UNO, $ARGV[0])or die "no\n";
@uno=<UNO>;
close(UNO);
open(DOS, $ARGV[1]) or die "no2\n";
@dos=<DOS>;
close(DOS);

chomp(@uno);
chomp(@dos);

for($i=0;$i<scalar(@uno);$i++){
	@dato=split("\t",$uno[$i]);
	if($dato[1] ne ''){
		$yave{$dato[1]}=$dato[0]
	}
}

$out='>good'.$ARGV[1];

open(OUT, $out);
for($i=0;$i<scalar(@dos);$i++){
	print OUT "$yave{$dos[$i]}\n";
}
