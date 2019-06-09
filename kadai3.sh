#!/bin/sh

##初期値設定
if [ "$1" -ge "$2" ]; then 
	a="$1"
       	b="$2"
else
        a="$2"
        b="$1"
fi	
r=$(($a % $b)) 

if  [ "$r" -eq "0" ]; then
        break
else    
	while [ "$r" -ne "0" ];
	do
		r=$(($a % $b))
		a="$b"
		b="$r"
		r=$(($a % $b))
	done
fi
echo "$b"

