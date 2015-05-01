# !bin/sh

> $2

while read line; do
	./branch_mispred $line >> $2
	echo $line
done < $1
