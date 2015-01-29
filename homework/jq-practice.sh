echo '1.'
cat ~/compciv/homework/congress-twitter/data-hold/legislators-current.json | ~/bin_compciv/jq '.[0] .name .last' | tr -d '"'
echo '2.'
cat ~/compciv/homework/congress-twitter/data-hold/legislators-current.json | ~/bin_compciv/jq '.[111] .id .bioguide' | tr -d '"'
echo '3.'
cat ~/compciv/homework/congress-twitter/data-hold/legislators-current.json | ~/bin_compciv/jq '.[13] .terms[2] .start' | tr -d '"'
echo '4.'
cat ~/compciv/homework/congress-twitter/data-hold/legislators-current.json | ~/bin_compciv/jq '.[4] | .name.first, .name.last, .bio.birthday' | tr -d '"'
echo '5.'
cat ~/compciv/homework/congress-twitter/data-hold/legislators-current.json | ~/bin_compciv/jq '.[] .bio.birthday' | sort -r | head -n 10 | tr -d '"'
echo '6.'
cat ~/compciv/homework/congress-twitter/data-hold/legislators-current.json | ~/bin_compciv/jq '.[] .bio.religion' | sort | uniq -c | sort -rn  | tr -d '"'
echo '7.'
cat ~/compciv/homework/congress-twitter/data-hold/legislators-current.json | ~/bin_compciv/jq --raw-output '.[] .terms[0] .start' | sort | cut -d '-' -f 1 | grep -c '2015'
echo '8.'
cat ~/compciv/homework/congress-twitter/data-hold/legislators-current.json | ~/bin_compciv/jq --raw-output '.[] .terms[] .start' | sort | sort -n | head -n 1 | grep -oE '[[:digit:]]{4}'
echo '9.'
cat ~/compciv/homework/congress-twitter/data-hold/legislators-current.json | ~/bin_compciv/jq --raw-output '.[] .terms[-1:][0].party' | grep -c 'Republican'
echo '10.'
cat ~/compciv/homework/congress-twitter/data-hold/legislators-current.json | ~/bin_compciv/jq --raw-output '.[] .terms[-1:][0].party' | grep -v -c -e "Republican" -e "Democrat"
echo '11.'
cat ~/compciv/homework/congress-twitter/data-hold/legislators-current.json | ~/bin_compciv/jq --raw-output '.[] .terms[] .rss_url' | grep -v 'null' | sort | uniq | head -n 10
echo '12.'
cat ~/compciv/homework/congress-twitter/data-hold/legislators-social-media.json | ~/bin_compciv/jq '.[] .social .twitter' | grep -v 'null' | wc -l
echo '13.'
cat ~/compciv/homework/congress-twitter/data-hold/legislators-social-media.json | ~/bin_compciv/jq '.[] .social .facebook' | grep -v 'null' | wc -l
echo '14.'
cat ~/compciv/homework/congress-twitter/data-hold/legislators-social-media.json | ~/bin_compciv/jq --raw-output '.[] | [.id .bioguide, .social .twitter] | @csv' | head -n 10
echo '15.'
cat ~/compciv/homework/congress-twitter/data-hold/legislators-social-media.json | ~/bin_compciv/jq --raw-output '.[] | [.id .bioguide, .social .twitter] | @csv' | grep -vE '[[:alpha:]]{2,}' 
echo '16.'
cat ~/compciv/homework/congress-twitter/data-hold/congress-twitter-profiles.json | ~/bin_compciv/jq '.[] .verified' | grep 'true' | wc -l
echo '17.'
cat ~/compciv/homework/congress-twitter/data-hold/congress-twitter-profiles.json | ~/bin_compciv/jq '.[] .followers_count' | sort -rn | head -n 1
echo '18.'
cat ~/compciv/homework/congress-twitter/data-hold/congress-twitter-profiles.json | ~/bin_compciv/jq --raw-output '.[] | [.name, .screen_name, .followers_count, .verified, .created_at] | @csv' | head -n 10
echo '19.'
cat ~/compciv/homework/congress-twitter/data-hold/congress-twitter-profiles.json | ~/bin_compciv/jq --raw-output '.[] | [.screen_name, .statuses_count, .followers_count, .status .created_at] | @csv' | head -n 10

