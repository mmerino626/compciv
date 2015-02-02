datafile='data-hold/namesample.txt'

name_matches=$(cat $datafile | grep "$name,")


for name in "$@"; do

	if [[ -n $name ]]
	then
	name=$name
	fi
	for row in $name_matches; do

	babies=$(echo $row | cut -d ',' -f '3')
		if [[ $row =~ ',M,' ]]
		then
		m_count=$((m_count + babies))
		else
		f_count=$((f_count + babies))
		fi
	done

total_babies=$((m_count + f_count))

	if [[ m_count -eq 0 && f_count -eq 0 ]]
	then
	g_and_pct="NA,0"
	else
	pct_female=$((100 * f_count / total_babies))
		if  [[ $pct_female -ge 50 ]]; then
		g_and_pct="F,$pct_female"
		else 
		g_and_pct="M,$((100 - pct_female))"
		fi
	fi
done 

if [[ -z $1 ]]
then
echo "Please pass in at least one name"
else
echo "$name,$g_and_pct,$total_babies"
fi

