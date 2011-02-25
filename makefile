# Copyright (c) 2011 Martin Ueding <dev@martin-ueding.de>

version = 0.1

tarballname = urt-silencer-$(version).tar.gz
tarball: $(tarballname)

projectFiles = silencer.sh silence-custom-maps.sh silence.wav blacklist.txt
$(tarballname): $(projectFiles)
	tar -czf $(tarballname) $(projectFiles)
