#(
#(
#cosa1:distALaRaiz,
#(
#cosa2:distancia,
#cosa3:distancia)
#distancia)
#

open(FI,$ARGV[0])or die "no hay archivo\n";
@fi=<FI>;
close(FI);
#@nu=();
#@pesos=();
@posi=(0);
$fi[0]=~/h\s=\s(\d+\.\d+|\d+)/;
$rama{0}=$1;
#print"$rama{0}\n";
print"(";
for($j=1;$j<scalar(@fi);$j++){
	$lin=$fi[$j];
	$lugar="--";
	@cadena=split("",$lin);
	for($i=0,$ip=0;$i<scalar(@cadena)-1;$i+=3,$ip++){
		$help=$cadena[$i].$cadena[$i+1];
		if($help eq $lugar){
			$pos=$ip;
			last;
		}
	}
#	$ch=scalar(@posi);
#	print" (pos) $pos =? $ch (scalar(posi)) : $lin ";
	if(scalar(@posi)-1<($pos)){			#####($posi[scalar(@posi)-1]<$pos)
		#print"---nuevo---";		
		if($lin=~/dendrogram/){
			$lin=~/h\s=\s(\d+\.\d+|\d+)/;
			$help=$1;
			#print"$1--->";
			$rama{$pos}=$help;
			$primer{$pos}="d";
			push(@posi,$pos);
			print"\n(";
		}
		elsif($lin=~/leaf/){
			$lin=~/\s.(\w+)/;
			$ayuda=$1.':'.$rama{$pos-1}.',';
			$primer{$pos}="l";
			push(@posi,$pos);
			print "$ayuda";
		}
	}
	else{
		#print"$lin nonuevo---";
		if($lin=~/leaf/){
			$lin=~/\"(\w+)\"/;
			$ayuda=$1.':'.$rama{$pos-1}.')';
			print "$ayuda\n";
		}
		for($i=scalar(@posi)-1;$i>=$pos;$i--){	#print"\n$i-->$posi[$i]-->";		###($i=$pos;$i<scalar(@posi);$i++)
			if(($primer{$i} eq "d")){				###(($lin=~/dendrogram/)&&($i>$pos))
				$valor=$rama{$i-1}-$rama{$i};
				print")\n:$valor";
				if($i==$pos){
					print",";
				}
				#$primer{$i}= "";
				#print"dend_1 $primer{$i}\n ";
			}
			if(($primer{$i} eq "l")&&($i!=$pos)){				###(($lin=~/dendrogram/)&&($i>$pos))
				$valor=$rama{$i-1}-$rama{$i};
				print":$valor)\n";
				#print"dendrogr_2 \$primer{$i} $primer{$i}\n";
			}
			splice(@posi,$i,1);
		}
#####copiado de arriba
		if($lin=~/dendrogram\sw/){
			$lin=~/h = (\d+\.\d+|\d+)/;
			$help=$1;
			$rama{$pos}=$help;
			push(@posi,$pos);
			print"\n(";
		}elsif($lin=~/--dendrogram/){
			print");\n";
		}
			
	}
	if($j==scalar(@fi)-1){
		$ch=scalar(@posi)-1;
#		print"\npos = $pos ::: ant = $ant\n";
	}
	$ant=$pos;
}
#print"\n@posi\n";
