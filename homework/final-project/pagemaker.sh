username=$1
username2=$2
mkdir -p "./data-hold"
echo "Fetching tweets for $1 into ./data-hold/$1-timeline.csv"
echo "Fetching tweets for $2 into ./data-hold/$2-timeline.csv"
file=data-hold/$1-timeline.csv
file2=data-hold/$2-timeline.csv
rm -f $file
rm -f $file2


t timeline $1 --csv -n 3200 > $file
t timeline $2 --csv -n 3200 > $file2

count=$(csvfix order -f 1 $file | wc -l)
count2=$(csvfix order -f 1 $file | wc -l)

lastdate=$(csvfix order -fn 'Posted at' $file | tail -n 1)
lastdate2=$(csvfix order -fn 'Posted at' $file2 | tail -n 1)

echo "Analyzing $count tweets by $1 since $lastdate"
echo "Analyzing $count2 tweets by $2 since $lastdate2"

echo "Top hashtag by $1"
hashtagequation1=$(csvfix order -fn Text $file | tr '[:upper:]' '[:lower:]' | grep -oE '#[[:alnum:]_]+' | sort | uniq -c | sort -r | head -n 1 )
csvfix order -fn Text $file | tr '[:upper:]' '[:lower:]' | grep -oE '#[[:alnum:]_]+' | sort | uniq -c | sort -r | head -n 1

echo "Top hashtag by $2"
hashtagequation2=$(csvfix order -fn Text $file2 | tr '[:upper:]' '[:lower:]' | grep -oE '#[[:alnum:]_]+' | sort | uniq -c | sort -r | head -n 1 )
csvfix order -fn Text $file2 | tr '[:upper:]' '[:lower:]' | grep -oE '#[[:alnum:]_]+' | sort | uniq -c | sort -r | head -n 1 

echo "Top tweeted word with 5+ letters by $1"
topwordequation1=$(csvfix order -fn Text $file | tr '[:upper:]' '[:lower:]' | sed -E 's/@[[:alnum:]]+//g' | sed -E 's/#[[:alnum:]]+//g' | sed -E 's/http[^ ]+//g' | grep -oE '[[:alpha:]]{5,}' | sort | uniq -c | sort -rn | head -n 1)
csvfix order -fn Text $file | tr '[:upper:]' '[:lower:]' | sed -E 's/@[[:alnum:]]+//g' | sed -E 's/#[[:alnum:]]+//g' | sed -E 's/http[^ ]+//g' | grep -oE '[[:alpha:]]{5,}' | sort | uniq -c | sort -rn | head -n 1

echo "Top tweeted word with 5+ letters by $2"
topwordequation2=$(csvfix order -fn Text $file2 | tr '[:upper:]' '[:lower:]' | sed -E 's/@[[:alnum:]]+//g' | sed -E 's/#[[:alnum:]]+//g' | sed -E 's/http[^ ]+//g' | grep -oE '[[:alpha:]]{5,}' | sort | uniq -c | sort -rn | head -n 1)
csvfix order -fn Text $file2 | tr '[:upper:]' '[:lower:]' | sed -E 's/@[[:alnum:]]+//g' | sed -E 's/#[[:alnum:]]+//g' | sed -E 's/http[^ ]+//g' | grep -oE '[[:alpha:]]{5,}' | sort | uniq -c | sort -rn | head -n 1


mkdir -p ~/WWW/twittercomparison
cd ~/WWW/twittercomparison

read -r -d '' page1_var <<'EOF'
<html>
        <head>
                <meta charset="%s" />
                <title>Comparing Twitter Handles</title> 
        </head>
        <body>
        <img src="%s">
        <h1>Comparing <a href="%s">Twitter</a> Users</h1>
        <h2><i>Comparing the top hashtags and tweets from %s and %s</i></h2>
        <form action="%s" method ="%s">
                <table>
                        <tr><td>First Handle: </td><td>%s</td></tr>
                        <tr><td>Second Handle: </td><td>%s</td></tr>
                        <tr><td><input type="%s" value="%s"></td></tr>
                </table>
        </form>
        </body>
</html>
EOF

printf "$page1_var" 'UTF-8' 'https://lh3.ggpht.com/lSLM0xhCA1RZOwaQcjhlwmsvaIQYaP3c5qbDKCgLALhydrgExnaSKZdGa8S3YtRuVA=w300' 'http://www.twitter.com' $1 $2 'page2.html' 'POST' $1 $2 'submit' 'Check it out!' > page1.html

read -r -d '' page2_var <<'EOF'
<html>
	 <head>
                <meta charset="%s" />
                <title>Comparing Twitter Handles: Results</title> 
        </head>
        <body>
        <img src="%s">
        <h1>Comparing <a href="%s">Twitter</a> Users: Results</h1>
        <h2><i>The results from comparing the following twitter handles, %s and %s:</i></h2>
        <form action="%s" method="%s">
              <table>
		   <tr><th></th><th>%s</th><th>%s</th></tr>
		   <tr><th>Top Hashtag</th><td>%s</td><td>%s</td></tr>
		   <tr><th>Top Word with 5+ characters</th><td>%s</td><td>%s</td></tr>
	      </table>
        </form>
        </body>
</html>
EOF

printf "$page2_var" 'UTF-8' 'https://lh3.ggpht.com/lSLM0xhCA1RZOwaQcjhlwmsvaIQYaP3c5qbDKCgLALhydrgExnaSKZdGa8S3YtRuVA=w300' 'http://www.twitter.com' $1 $2 'page2.html' 'POST' $1 $2 $hashtagequation1 $hashtagequation2 $topwordequation1 $topwordequation2 > page2.html
