# r-bookdown [deprecated]


|Note:|
|-------------------------------------------------------------------------------------------|
| This image has been deprecated in favour of [alpine-r-bookdown](https://github.com/ConorIA/dockerfiles/tree/master/alpine-r-bookdown). Please use that image. |
||

Dockerfile based on [jangorecki/r-base-dev](https://hub.docker.com/r/jangorecki/r-base-dev/) including [pandoc](http://pandoc.org/) 1.13.1 and [bookdown](https://bookdown.org/). There is also an example of the `.gitlab-ci.yml` file to build a book and publish as a Gitlab page. Note that this build does not include LaTeX, so it is only useful for building HTML books. Not PDF. 
