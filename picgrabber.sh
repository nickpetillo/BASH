#/bin/bash

#download HTML file
curl 'http://browncardigan.com/?page=[1-1000]' -o '#1.html'

#grab images in page
grep -o '<img class="main"[ ]*src="[^"]*"' *.html >pix.txt

#parse for just url

awk {'print $3'} pix.txt >url.txt

sed 's/src="//g' url.txt > url2.txt

sed 's/"//g' url2.txt >urlfinal.txt

#downloads images
sort -u urlfinal.txt | wget -P /Users/nicholaspetillo/Desktop/BC_PICS -i-


#remove extra files

rm -rf *.html
rm -rf *.txt
