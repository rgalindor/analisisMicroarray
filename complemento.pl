open(PRIM,$ARGV[0])or die"No se abrio el  primer archivo\n";
chomp(@prim);
@news=();
		$gen1=~s/ //;
		$bandera=&busqueda($gen1, \@prim);
			push(@news, $gen1);
		}
	}
my ($buscado, $donde)=@_;
	$flag=0;
	foreach $este(@$donde){
		if($buscado eq $este){
			$flag=1;
			last;
		}
	}
	return $flag;
}
