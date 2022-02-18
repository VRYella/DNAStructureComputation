LS="*.uniq*"
#LS="10merr.11_rise"
for 	file1 in $LS
    do

grep -v ">" $file1 > ${file1}_tab

perl Hexamer_dnase.pl  ${file1}_tab
perl Pentanucleotide_features.pl ${file1}_tab
perl New_Dinucleotide_features.pl   ${file1}_tab
perl trinucleotide_features.pl  ${file1}_tab
perl minor_groove256_eachstep.pl  ${file1}_tab
perl trx_scale_256.pl ${file1}_tab
perl tetrarise_eachstep.pl ${file1}_tab

done

LS="*_tab.*"
#LS="10merr.11_rise"
for 	file1 in $LS
    do

awk '{for (f = 1; f <= NF; f++)a[NR, f] = $f} END {for (f = 1; f <= NF; f++)for (r = 1; r <= NR; r++)printf a[r, f] (r==NR ? RS : FS)}' $file1|awk '{tot=0; for (i=1;i<=NF;i++)tot +=$i; print tot/NF;}'  |nl -v-500  >nl_${file1}

   done



rm -rf *_tab

