# MongoDB for ARMv8.0-A

* Currently, the official mongodb distribution does not support armv8.0-a.
* Official binaries cannot run 5.0+ on older boards like Raspberry Pi4.
* So this repository provides scripts for build and precompiled binaries.
* Because it takes too much time to build, it is not possible to build in CI such as Github Actions. (over 12h ?)
* Therefore, the binary may not be built for every version and may not be updated.
* You can build directly on arm64 if needed.

# License

Apache 2.0
