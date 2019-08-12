# pkgbuilder:manjaro

This image provides a clean base Manjaro image used to test makepkg. It is built on The tool itself was inspired by [dkubb/haskell-builder](https://github.com/dkubb/haskell-builder), with some GPG key-related commands cribbed form [zalox/manjaro](https://hub.docker.com/r/zalox/manjaro/). The image uses pacaur to resolve makepkg dependencies so that packages that depend on other packages in the AUR can be installed as if calling `makepkg -s`.

## Usage
Navigate to the folder containing your makefile and execute:
`docker run --rm -v "$(pwd):/src" conoria/pkgbuilder:manjaro`

## Base image date
09/19/16
