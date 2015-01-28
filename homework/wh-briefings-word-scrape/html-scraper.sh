cat ~/compciv/homework/wh-briefings-word-scrape/data-hold/* | pup '#content text{}' | grep -oE '[[:alpha:]]{7,}' | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -rn | head -n 10
cd ~/compciv/homework/wh-briefings/word-scrape

