mkdir -p data-hold

curl -s http://www.dallaspolice.net/ois/ois.html > data-hold/ois.html
curl -s http://www.dallaspolice.net/ois/ois_2003.html > data-hold/ois_2003.html
curl -s http://www.dallaspolice.net/ois/ois_2004.html > data-hold/ois_2004.html
curl -s http://www.dallaspolice.net/ois/ois_2005.html > data-hold/ois_2005.html
curl -s http://www.dallaspolice.net/ois/ois_2006.html > data-hold/ois_2006.html
curl -s http://www.dallaspolice.net/ois/ois_2007.html > data-hold/ois_2007.html
curl -s http://www.dallaspolice.net/ois/ois_2008.html > data-hold/ois_2008.html
curl -s http://www.dallaspolice.net/ois/ois_2009.html > data-hold/ois_2009.html
curl -s http://www.dallaspolice.net/ois/ois_2010.html > data-hold/ois_2010.html
curl -s http://www.dallaspolice.net/ois/ois_2011.html > data-hold/ois_2011.html
curl -s http://www.dallaspolice.net/ois/ois_2012.html > data-hold/ois_2012.html

domain='http://www.dallaspolice.net'


cat data-hold/ois.html | pup 'td:nth-of-type(1)' | grep -oE 'href="/ois/docs/narrative/[^"]+"' | grep -oP '".*?"' | tr -d '"' > downloadlist.txt
cat data-hold/ois_2003.html | pup 'td:nth-of-type(1)' | grep -oE 'href="/ois/docs/narrative/[^"]+"' | grep -oP '".*?"' | tr -d '"' >> downloadlist.txt
cat data-hold/ois_2004.html | pup 'td:nth-of-type(1)' | grep -oE 'href="/ois/docs/narrative/[^"]+"' | grep -oP '".*?"' | tr -d '"' >> downloadlist.txt
cat data-hold/ois_2005.html | pup 'td:nth-of-type(1)' | grep -oE 'href="/ois/docs/narrative/[^"]+"' | grep -oP '".*?"' | tr -d '"' >> downloadlist.txt
cat data-hold/ois_2006.html | pup 'td:nth-of-type(1)' | grep -oE 'href="/ois/docs/narrative/[^"]+"' | grep -oP '".*?"' | tr -d '"' >> downloadlist.txt
cat data-hold/ois_2007.html | pup 'td:nth-of-type(1)' | grep -oE 'href="/ois/docs/narrative/[^"]+"' | grep -oP '".*?"' | tr -d '"' >> downloadlist.txt
cat data-hold/ois_2008.html | pup 'td:nth-of-type(1)' | grep -oE 'href="/ois/docs/narrative/[^"]+"' | grep -oP '".*?"' | tr -d '"' >> downloadlist.txt
cat data-hold/ois_2009.html | pup 'td:nth-of-type(1)' | grep -oE 'href="/ois/docs/narrative/[^"]+"' | grep -oP '".*?"' | tr -d '"' >> downloadlist.txt
cat data-hold/ois_2010.html | pup 'td:nth-of-type(1)' | grep -oE 'href="/ois/docs/narrative/[^"]+"' | grep -oP '".*?"' | tr -d '"' >> downloadlist.txt
cat data-hold/ois_2011.html | pup 'td:nth-of-type(1)' | grep -oE 'href="/ois/docs/narrative/[^"]+"' | grep -oP '".*?"' | tr -d '"' >> downloadlist.txt
cat data-hold/ois_2012.html | pup 'td:nth-of-type(1)' | grep -oE 'href="/ois/docs/narrative/[^"]+"' | grep -oP '".*?"' | tr -d '"' >> downloadlist.txt
