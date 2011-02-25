# Copyright (c) 2011 Martin Ueding <dev@martin-ueding.de>

version = 0.1

tarballname = urt-silencer-$(version).tar.gz
tarball: $(tarballname)

$(tarballname): silencer.sh silence.wav blacklist.txt
	tar -czf $(tarballname) silencer.sh silence.wav blacklist.txt
