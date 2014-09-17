#!/bin/bash
#find Interface names and ifdata

ip=$(ifconfig | grep 'inet' | grep '10..' | awk '{print $2}')

#arr=($(ifconfig | expand | cut -c1-8 | sort | uniq -u | awk -F: '{print $1;}'))


ifconfig | expand | cut -c1-8 | sort | uniq -u | awk -F: '{print $1;}' | while read interface; do
	iface=$(ifdata -pa $interface);
	if [ "$iface" = "$ip" ]
then
  	echo "$interface"
fi
done

#for i in "${arr[@]}"
#do
#	$interface=(ifdata -pa $i)
#done

#echo $interface
