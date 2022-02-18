#! /usr/bin/perl
open(FH, "$ARGV[0]")||die "file does not exist";

open (FH4,">$ARGV[0].1_freeen");
open (FH9,">$ARGV[0].2_mechen");
open (FH10,">$ARGV[0].3_persist");
open (FH11,">$ARGV[0].4_trx");
open (FH7,">$ARGV[0].4_twist");
open (FH8,">$ARGV[0].4_twistdp");
open (FH6,">$ARGV[0].5_stiff");
open (FH3,">$ARGV[0].6proppdb");
open (FH2,">$ARGV[0].7_wedge");
open (FH5,">$ARGV[0].gc");


while ($str=<FH>) {
chomp($str);
$len=length($str);

%freeen=(AA,-1.0,AC,-1.44,AG,-1.28,AT,-0.88,CA,-1.45,CC,-1.84,CG,-2.17,CT,-1.28,GA,-1.30,GC,-2.24,GG,-1.84,GT,-1.44,TA,-0.58,TC,-1.30,TG,-1.45,TT,-1.0);
%mechen=(AA,-1.36,AC,-2.03,AG,-1.60,AT,-2.35,CA,-0.81,CC,-1.64,CG,-2.06,CT,-1.60,GA,-1.39,GC,-3.42,GG,-1.64,GT,-2.03,TA,-1.01,TC,-1.39,TG,-0.81,TT,-1.36);
%stiff=(AA,1820,AC,1660,AG,2390,AT,5500,CA,1370,CC,3500,CG,1340,CT,2390,GA,1230,GC,2350,GG,3500,GT,1660,TA,1990,TC,1230,TG,1370,TT,1820);
%twist=(AA,35.1,AC,31.5,AG,31.9,AT,29.3,CA,37.3,CC,32.9,CG,36.1,CT,31.9,GA,36.3,GC,33.6,GG,32.9,GT,31.5,TA,37.8,TC,36.3,TG,37.3,TT,35.1);
%twistdisp=(AA,3.9,AC,4.2,AG,4.5,AT,4.5,CA,6.5,CC,5.2,CG,5.5,CT,4.5,GA,4.4,GC,4.7,GG,5.2,GT,4.2,TA,5.5,TC,4.4,TG,6.5,TT,3.9);
%persistence=(AA,50.4,AC,55.4,AG,51,AT,40.9,CA,46.7,CG,56,CT,51,GA,54.4,GC,44.6,GG,41.7,GG,41.7,GT,55.4,TA,44.7,TC,54.4,TG,46.7,TT,50.4);
%wedge=( AA,7.2,AC,1.1,AG,8.4,AT,2.6,CA,3.5,CC,2.1,CG,6.7,CT,8.4,GA,5.3,GC,5,GG,2.1,GT,1.1,TA,0.9,TC,5.3,TG,3.5,TT,7.2);
%prop=(AA,-17.30,AC,-6.7,AG,-14.3,AT,-16.9,CA,-8.6,CC,-12.8,CG,-11.2,CT,-14.3,GA,-15.1,GC,-11.7,GG,-12.8,GT,-6.7,TA,-11.1,TC,-15.1,TG,-8.6,TT,-17.3);
%gc=(AA,0.00,AC,0.50,AG,0.50,AT,0.00,CA,0.50,CC,1.00,CG,1.00,CT,0.50,GA,0.50,GC,1.00,GG,1.00,GT,0.50,TA,0.00,TC,0.50,TG,0.50,TT,0.00);
%trx=(AA,5,AC,4,AG,9,AT,0,CA,42,CC,42,CG,43,CT,9,GA,22,GC,25,GG,42,GT,4,TA,14,TC,22,TG,42,TT,5);


	for($i=0;$i<$len-15;$i++)
			{
				$seq=substr($str,$i,15);
			#	 				   
				$temp=0;
				for($k=0;$k<1;$k++)

					{						
						$tempprop=+$prop{substr($seq,$k,2)};
						$tempwedge=+$wedge{substr($seq,$k,2)};
						$tempfreeen=+$freeen{substr($seq,$k,2)};
						$tempgc=+$gc{substr($seq,$k,2)};
						$tempstiff=+$stiff{substr($seq,$k,2)};
						$temptwist=+$twist{substr($seq,$k,2)};
						$temptwistdisp=+$twistdisp{substr($seq,$k,2)};
						$tempmechen=+$mechen{substr($seq,$k,2)};
						$temppersist=+$persistence{substr($seq,$k,2)};
						$temptrx=+$trx{substr($seq,$k,2)};
						
						
						print FH2 "$tempwedge/14\t";
						print FH3 "$tempprop/14\t";
						print FH4 "$tempfreeen/14\t";
						print FH5 "$tempgc/14\t";
					        print FH6 "$tempstiff/14\t";
                   				print FH7 "$temptwist/14\t";
						print FH8 "$temptwistdisp/14\t";
						print FH9 "$tempmechen/14\t";
						print FH10 "$temppersist/14\t";
						print FH11 "$temptrx/14\t";
						
					
					}
			      
			}
print FH2 "\n";
print FH3 "\n";
print FH4 "\n";
print FH5 "\n";
print FH8 "\n";
print FH6 "\n";
print FH7 "\n";
print FH9 "\n";
print FH10 "\n";
print FH11 "\n";

}

close (FH);
close (FH2);
close (FH3);
close (FH4);
close (FH5);
close (FH6);
close (FH7);
close (FH8);
close (FH9);
close (FH10);
close (FH11);




