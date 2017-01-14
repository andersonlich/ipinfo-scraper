#!/bin/bash
while read asn; do
	wget -O list.txt http://ipinfo.io/$asn
	grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}...' list.txt > $asn.memes
	awk '!a[$0]++' $asn.memes > $asn.pepe
	awk '{print $1}' $asn.pepe > $asn.txt
	rm $asn.pepe
	rm $asn.memes
done < RU_asn.txt
