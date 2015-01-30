mkdir -p data-hold
cd data-hold
curl http://www.tdcj.state.tx.us/death_row/dr_offenders_on_dr.html -o "TXlist1.html"
curl http://www.tdcj.state.tx.us/death_row/dr_list_all_dr_1923-1973.html -o "TXlist2.html"
curl http://www.dc.state.fl.us/activeinmates/deathrowroster.asp -o "FLlist1.html"
curl http://www.dc.state.fl.us/oth/deathrow/execlist.html -o "FLlist2.html"
curl http://www.dc.state.fl.us/oth/deathrow/execlist2.html -o "FLlist3.html"
curl http://www.cdcr.ca.gov/capital_punishment/docs/condemnedinmatelistsecure.pdf -o "CAlist.html"
cd ~/compciv/homework/death-row-parsing
