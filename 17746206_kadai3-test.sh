#!/bin/sh

if [ $# -ne 2 ] ;then
       echo "input 2 argements" 1>&2 
       exit 1
fi
expr $1 + $2 > /dev/null 2>&1
if [ $? -ge 2 ]; then
	echo "引数が自然数ではないです" 1>&$1
	exit 1
fi

#####以下元データと同じプログラム
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
#echo "$1 と$2 の最大公約数は$b"

###テストプログラム再開ここから
result=$(./17746206_kadai3.sh)
result2="$b"

if [ "$result" -eq "$result2" ]; then 
	echo "OK"
else
	echo "NG"
fi

