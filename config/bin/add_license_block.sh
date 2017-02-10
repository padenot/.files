#! /bin/sh

OWNER="Paul ADENOT \& Martin Richard"
YEAR="2011"
ORGANIZATION="bim"
FILEAUTHOR="Paul ADENOT <paul@paul.cx>"

fill_license_block()
{
  cp license license_filled
  sed -i "s/<OWNER>/$OWNER/" license_filled
  sed -i "s/<YEAR>/$YEAR/" license_filled
  sed -i "s/<ORGANIZATION>/$ORGANIZATION/" license_filled
  sed -i "s/<FILEAUTHOR>/$FILEAUTHOR/" license_filled
}

if [ ! -e license_filled ]
then
  fill_license_block
fi

for i in $*
do
  echo "Processing $i"
  cat license_filled $i > temp
  mv temp $i
done
