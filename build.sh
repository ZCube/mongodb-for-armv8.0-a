#!/bin/bash
git -C "mongo" pull https://github.com/mongodb/mongo r${VERSION} || git clone -b r${VERSION} --depth=1 https://github.com/mongodb/mongo mongo
cd mongo
python3 -m pip install -r etc/pip/compile-requirements.txt

# raspberrypi 4 :fp asimd evtstrm crc32 cpuid
# nanopi r4s :fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
# apple m1 :fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma
#           lrcpc dcpop sha3 asimddp sha512 asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp f
#           lagm2 frint
# odroid m1 : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp

export flags=''
case "$(dpkg --print-architecture)" in
	amd64) flags='' ;;
	# arm64) flags='CCFLAGS="-march=armv8-a+fp+simd" CFLAGS="-march=armv8-a+fp+simd" --use-hardware-crc32=off' ;;
	# arm64) flags='CCFLAGS="-march=armv8-a" CFLAGS="-march=armv8-a" --use-hardware-crc32=off' ;;
	arm64) flags='CCFLAGS="-march=armv8-a+fp+crc+simd" CFLAGS="-march=armv8-a+fp+crc+simd"' ;;
esac
echo ${flags}
# python3 buildscripts/scons.py ${flags} -j $(getconf _NPROCESSORS_ONLN) install-all
python3 buildscripts/scons.py ${flags} --separate-debug=on --install-mode=hygienic --disable-warnings-as-errors install-servers

