if(scalar(@ARGV)==2){
	open(UNO,$ARGV[0])or die"No se pudo abrir $ARGV[0]\n";
	open(DOS,$ARGV[1])or die"No se pudo abrir $ARGV[1]\n";
	@uno=<UNO>;
	@dos=<DOS>;
	close(UNO);
	close(DOS);
	foreach $gen1(@uno){
		chomp($gen1);
		$gen1=~s/ //;
		foreach $gen2(@dos){
			chomp($gen2);
			$gen2=~s/ //;
			if($gen1 eq $gen2){
				print"$gen1\n";
				last;
			}
		}
	}
}
else{
	my %arre;
	open(PRIM,$ARGV[0])or die"No se abrio el  primer archivo\n";
	@prim=<PRIM>;
	close(PRIM);
	foreach $va(@ARGV){
		open(VAR, $va) or die "Error al abrir $va";
		@nuevo=<VAR>;
		close(VAR);
		@tmp=();
		foreach $gen1(@prim){
			chomp($gen1);
			foreach $gen2(@nuevo){
				chomp($gen2);
				if($gen1 eq $gen2){
					push(@tmp, $gen1);
					last;
				}
			}
		}
		@prim=@tmp;
	}
	foreach $r(@prim){
		print"$r\n";
	}
}

