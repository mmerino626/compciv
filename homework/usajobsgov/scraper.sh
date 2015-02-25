td="./data-hold/scrapes/$(date +%Y-%m-%d_%H00)"
mkdir -p $td

for snum in $series; do

	echo "Fetching series $snum, page 1"
	curl -s "https://data.usajobs.gov/api/jobs?Series=$snum&NumberOfJobs=250&Page=1" -o "$td/$snum-1.json"

	total_pages=$(cat "$td/$snum-1.json" | jq -r '.Pages')

	for p in $(seq 2 $total_pages); do
		echo "Fetching series $snum, page $p"
		curl -s "https://data.usajobs.gov/api/jobs?Series=$snum&NumberOfJobs=250&Page=$p" -o "$td/$snum-$p.json"
	done
done
