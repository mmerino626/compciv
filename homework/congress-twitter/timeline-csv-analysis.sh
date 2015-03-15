username=$1

mkdir -p "./data-hold"
echo "Fetching tweets for $1 into ./data-hold/$1-timeline.csv"

file=data-hold/$1-timeline.csv
rm -f $file


t timeline $1 --csv -n 3200 > $file

count=$(csvfix order -f 1 $file | wc -l)
lastdate=$(csvfix order -fn 'Posted at' $file | tail -n 1)
echo "Analyzing $count tweets by $1 since $lastdate"

echo "Top 10 hastags by $1"
csvfix order -fn Text $file | tr '[:upper:]' '[:lower:]' | grep -oE '#[[:alnum:]_]+' | sort | uniq -c | sort -r | head -n 10

echo "Top 10 retweeted users by $1"
csvfix order -fn Text $file | grep -oE 'RT @[[:alnum:]_]+' | tr '[:upper:]' '[:lower:]' | grep -oE '@[[:alnum:]_]+' | sort | uniq -c | sort -r | head -n 10

echo "Top 10 mentioned users by $1"
csvfix order -fn Text $file | grep -vE '\bRT\b' | tr '[:upper:]' '[:lower:]' | grep -vi "@$1" | grep -oE '@[[:alnum:]_]+' | sort | uniq -c | sort -r | head -n 10

echo "Top tweeted 10 words with 5+ letters by $1"
csvfix order -fn Text $file | tr '[:upper:]' '[:lower:]' | sed -E 's/@[[:alnum:]]+//g' | sed -E 's/#[[:alnum:]]+//g' | sed -E 's/http[^ ]+//g' | grep -oE '[[:alpha:]]{5,}' | sort | uniq -c | sort -rn | head -n 10


