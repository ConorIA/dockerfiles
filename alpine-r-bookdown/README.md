# alpine-r-bookdown

 [![](https://images.microbadger.com/badges/version/conoria/alpine-r-bookdown.svg)](http://microbadger.com/images/conoria/alpine-r-bookdown "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/conoria/alpine-r-bookdown.svg)](http://microbadger.com/images/conoria/alpine-r-bookdown "Get your own image badge on microbadger.com")

Dockerfile based on [conoria/alpine-pandoc](https://hub.docker.com/r/conoria/alpine-pandoc/), including [R](https://www.r-project.org/) and [bookdown](https://bookdown.org/). Also included is an example of a `.gitlab-ci.yml` file to build a book and publish as a Gitlab page. Note that this build does not include LaTeX, so it is only useful for building HTML books. Not PDF. 
