#!/bin/bash
for protocol in 'http://' 'https://';do
while read line ;do
	code=$(timeout 5 curl -L -s -w "%{http_code}\n" -o /dev/null $protocol$line)
	if [ $code = "000" ];then
		echo "$protocol$line: not respond"
	else
		echo "$protocol$line: $code"
		echo "$protocol$line: $code" >> livedomains.txt
	fi
done < domains.txt
done
