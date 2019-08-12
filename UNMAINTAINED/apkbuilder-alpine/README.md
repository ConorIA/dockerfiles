# apkbuilder-alpine

This image does one thing only: it builds [pandoc](http://pandoc.org/) and pandoc-citeproc packages for Alpine Linux. It leverages the cabal port included in [mitchty/alpine-ghc](https://github.com/mitchty/alpine-ghc). The `APKBUILD` borrows most functions from the [`pandoc-cabal`](https://aur.archlinux.org/packages/pandoc-cabal/) `PKGBUILD` for Arch Linux, which is maintatined by joni. 

The actual work done by this image now happens over at [GitLab](https://gitlab.com/ConorIA/alpine-pandoc).

__Note: You will probably never have to run this image!__
