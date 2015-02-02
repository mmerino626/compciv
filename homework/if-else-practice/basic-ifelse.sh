if [[ "$#" -lt 1 ]]; then
echo "You need at least one argument"
elif [[ "$#" -eq 1 ]]; then
echo "There is just one argument: $1"
elif [[ "$#" -eq 2 ]]; then
echo "There are just two arguments: $1 and $2"
	if [[ $1 -eq $2 ]]; then
	echo "$1 is equal to $2"
	elif [[ $1 -lt $2 ]]; then
	echo "$1 is less than $2"
	elif [[ $1 -gt $2 ]]; then
	echo "$1 is greater than $2"
	fi

elif [[ "$#" -eq 3 ]]; then
echo "There are three arguments: $1, $2, and $3"
	if [[ $1 -eq $2 && $2 -eq $3 ]]; then
	echo "$1 is equal to $2 and is equal to $3"
	elif [[ $1 -eq $2 && $1 -gt $3 ]]; then
	echo "$1 is equal to $2 and is greater than $3"
	elif [[ $1 -eq $2 && $1 -lt $3 ]]; then
	echo "$1 is equal to $2 and is less than $3"
	elif [[ $1 -gt $2 && $1 -eq $3 ]]; then
	echo "$1 is greater than $2 and is equal to $3"
	elif [[ $1 -gt $2 && $1 -lt $3 ]]; then
	echo "$1 is greater than $2 and is less than $3"
	elif [[ $1 -gt $2 && $1 -gt $3 ]]; then
	echo "$1 is greater than $2 and is greater than $3"
	elif [[ $1 -lt $2 && $1 -eq $3 ]]; then
	echo "$1 is less than $2 and is equal to $3"
	elif [[ $1 -lt $2 && $1 -gt $3 ]]; then
	echo "$1 is less than $2 and is greater than $3"
	elif [[ $1 -lt $2 && $1 -lt $3 ]]; then
	echo "$1 is less than $2 and is less than $3"
fi

else
	echo "You need fewer than $# arguments"


fi
