datadir="./data-hold/scrapes/$1"
yearly_jobs=$(cat $datadir/*.json | jq '.JobData[] | select(.SalaryBasis == "PerYear")')

simple_rows=$(echo $yearly_jobs | jq '. | {JobTitle, SalaryMin, SalaryMax}')

echo $simple_rows | jq -r '.JobTitle' | sort | uniq -c | sort -rn | head -n 25 | while read -r line; do
	title=$(echo $line | grep -oE '[[:alpha:]].+')
	filtered_rows=$(echo $simple_rows | jq "select(.JobTitle == \"$title\")")
	min=$(echo $filtered_rows | jq -r '.SalaryMin' | tr -d '$' | tr -d ',' | sort -n | head -n 1)
	max=$(echo $filtered_rows | jq -r '.SalaryMax' | tr -d '$' | tr -d ',' | sort -rn | head -n 1)
done
