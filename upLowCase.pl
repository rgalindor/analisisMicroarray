open(FI, $ARGV[1])or die"no se pudo abrir $ARGV[1]\n";
@fi=<FI>;
close(FI);
foreach $li(@fi){
	if($ARGV[0] eq 'M'){ $li=uc($li);}
	elsif($ARGV[0] eq 'm'){ $li=lc($li);}
	print $li;
}
