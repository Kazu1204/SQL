#!/bin/sh

# arg1 -- loop count

i=1

while [ $i -le $1 ]
do
sh ./ic_loop.sh &
i=`expr $i + 1`
done

exit

