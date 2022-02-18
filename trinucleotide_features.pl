#! /usr/bin/perl
open(FH, "$ARGV[0]")||die "file does not exist";

open (FH2,">$ARGV[0].9_nucle");
open (FH3,">$ARGV[0].8_dnase");


while ($str=<FH>) {
chomp($str);
$len=length($str);
#print $len;
#print "running prog\n";
%nucle = ('AAA' => 36,'AAC' => 6,'AAG' => 6,'AAT' => 30,'ACA' => 6,'ACC' => 8,'ACG' => 8,'ACT' => 11,'AGA' => 9,'AGC' => 25,'AGG' => 8,'AGT' => 11,'ATA' => 13,'ATC' => 7,'ATG' => 18,'ATT' => 30,'CAA' => 9,'CAC' => 17,'CAG' => 2,'CAT' => 18,'CCA' => 8,'CCC' => 13,'CCG' => 2,'CCT' => 8,'CGA' => 31,'CGC' => 25,'CGG' => 2,'CGT' => 8,'CTA' => 18,'CTC' => 8,'CTG' => 2,'CTT' => 6,'GAA' => 12,'GAC' => 8,'GAG' => 8,'GAT' => 7,'GCA' => 13,'GCC' => 45,'GCG' => 25,'GCT' => 25,'GGA' => 5,'GGC' => 45,'GGG' => 13,'GGT' => 8,'GTA' => 6,'GTC' => 8,'GTG' => 17,'GTT' => 6,'TAA' => 20,'TAC' => 6,'TAG' => 18,'TAT' => 13,'TCA' => 8,'TCC' => 5,'TCG' => 31,'TCT' => 9,'TGA' => 8,'TGC' => 13,'TGG' => 8,'TGT' => 6,'TTA' => 20,'TTC' => 12,'TTG' => 9,'TTT' => 36);

%dnase1 = (
'AAT' => -0.280,'ATT' => -0.280,'AAA' => -0.274,'TTT' => -0.274,'CCA' => -0.246,'TGG' => -0.246,'AAC' => -0.205,'GTT' => -0.205,'CCG' => -0.136,'CGG' => -0.136,'ATC' => -0.110,'GAT' => -0.110,'ACT' => -0.183,'AGT' => -0.183,'AAG' => -0.081,'CTT' => -0.081,'CGC' => -0.077,'GCG' => -0.077,'AGG' => -0.057,'CCT' => -0.057,'GAA' => -0.037,'TTC' => -0.037,'ACG' =>-0.033,'CGT' => -0.033,'ACC' => -0.032,'GGT' => -0.032,'GAC' => -0.013,'GTC' => -0.013,'CCC' => -0.012,'GGG' => -0.012,'ACA' => -0.006,'TGT' => -0.006,'CGA' => -0.003,'TCG' => -0.003,'GGA' => 0.013,'TCC' => 0.013,'CAA' => 0.015,'TTG' => 0.015,'AGC' => 0.017,'GCT' => 0.017,'GTA' => 0.025,'TAC' => 0.025,'AGA' => 0.027,'TCT' => 0.027,'CTC' => 0.031,'GAG' => 0.031,'CAC' => 0.040,'GTG' => 0.040,'TAA' => 0.068,'TTA' => 0.068,'GCA' => 0.076,'TGC' => 0.076,'CTA' => 0.090,'TAG' => 0.090,'GCC' => 0.107,'GGC' => 0.107,'ATG' => 0.134,'CAT' => 0.134,'CAG' => 0.175,'CTG' => 0.175,'ATA' => 0.182,'TAT' => 0.182,'TCA' => 0.194,'TGA' => 0.194);
$WINDOW=30;
for($i=0;$i<$len-$WINDOW;$i++)
			{
				$seq=substr($str,$i,30);
				$temp=0;
				for($k=0;$k<1;$k++)
	
					{
						$tempnucle=+$nucle{substr($seq,$k,3)};
						$tempdnase1=+$dnase1{substr($seq,$k,3)};
						print FH2 "$tempnucle/28\t";
						print FH3 "$tempdnase1/28\t";
					
					}
                                
			}
print FH2 "\n";
print FH3 "\n";
}
close (FH);
close (FH2);
close (FH3);





