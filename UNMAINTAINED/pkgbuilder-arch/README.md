# pkgbuilder

This image provides a clean base Arch image used to test makepkg. The tool itself was inspired by [dkubb/haskell-builder](https://github.com/dkubb/haskell-builder), with some commands cribbed form [logankoester/archlinux](https://hub.docker.com/r/logankoester/archlinux/). The image uses pacaur to resolve makepkg dependencies so that packages that depend on other packages in the AUR can be installed as if calling makepkg -s.

## Usage
Navigate to the folder containing your makefile and execute:
`docker run --rm -v "$(pwd):/src" conoria/pkgbuilder:arch`
