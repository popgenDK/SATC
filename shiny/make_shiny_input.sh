INFILES=$1
OUTFILE=$2

# make header line
echo -e -n 'scaffold len ' > $OUTFILE
cat $INFILES | xargs -n1 basename | sed 's/\.[^.]*$//g' | tr '\n' ' ' >> $OUTFILE
echo >> $OUTFILE

F1=`cat $INFILES | head -1`
FILES=`cat $INFILES`
paste <( cut -f1-2 $F1 ) <(awk '{ a[FNR] = (a[FNR] ? a[FNR] FS : "") $3 } END { for(i=1;i<=FNR;i++) print a[i] }' $FILES ) >> $OUTFILE
