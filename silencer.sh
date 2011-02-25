#!/bin/bash
# Copyright (c) 2011 Martin Ueding <dev@martin-ueding.de>

URTPATH=/opt/UrbanTerror
ZPAK=$URTPATH/q3ut4/zpak000_assets.pk3

# extract everything in a working directory
unzip $ZPAK -d zpak

# replace some of the sound files with an empty wav file
for nukeit in `cat blacklist.txt`
do
	cp silence.wav $nukeit
done

# repack everything
cd zpak
zip -r ../zpak.pk3 *
cd ..

# create a backup of the original ZPAK, copy the silenced one to there
sudo mv $ZPAK $ZPAK.noisy
sudo mv zpak.pk3 $ZPAK

# clean up the working directory
rm -rf zpak
