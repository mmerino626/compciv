cat FLlist1.html | ~/bin_compciv/pup 'td:nth-of-type(3) text{}' | tail -n 500 | grep -vP '\xc2\xa0'
cat FLlist2.html | ~/bin_compciv/pup 'td:nth-of-type(3) text{}'
cat FLlist3.html | ~/bin_compciv/pup 'td:nth-of-type(3) text{}'
