cat CAlistnew.txt | grep -v '[[:alpha:]]{4,}' | grep -o -e "BLA" -e "HIS" -e "WHI" -e "OTH"
