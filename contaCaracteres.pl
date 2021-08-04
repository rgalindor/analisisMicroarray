open(FILE, $ARGV[0]) or die "no\n";
@fi=<FILE>;
close(FILE);
@algo=split("",$fi[$ARGV[1]]);
$c=0;
for($i=0;$i<scalar(@algo);$i++){
	if($algo[$i] eq "\t"){
		$c+=1;
	}
}

print"$c\n";
