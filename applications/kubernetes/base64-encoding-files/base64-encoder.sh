#! /bin/bash
input_keys=$1
output_keys=$2
#if output file isn't empty , we empty it : 
if [ -s "$output_keys" ];  then 

	> "$output_keys"
fi
while read -r line ; do 
	echo -n "$line" | base64 >> "$output_keys"
done < "$input_keys"

