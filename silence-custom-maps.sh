#!/bin/bash
# Copyright (c) 2011 Martin Ueding <dev@martin-ueding.de>

MAPPATH=~/.q3a/q3ut4

for map in $MAPPATH/*.pk3
do
	echo $map
	# extract everything in a working directory
	unzip $map -d mappak > /dev/null

	# replace some of the sound files with an empty wav file
	for nukeit in `find mappak | egrep ".*\\.wav$$"`
	do
		echo "nuking $nukit"
		cp silence.wav $nukeit
	done

	# create a backup of the original map
	mv $map $map.noisy

	# repack everything
	cd mappak
	zip -r $map * > /dev/null
	cd ..

	# clean up the working directory
	rm -rf mappak
done
