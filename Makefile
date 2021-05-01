.PHONY: install start build

install:
	docker run -it -v ${PWD}:/site -w /site alombarte/hugo npm install

start:
	docker run -it -v ${PWD}:/site -p "1313:1313" alombarte/hugo hugo server --bind 0.0.0.0

build:
	docker run -it -v ${PWD}:/site -p "1313:1313" alombarte/hugo hugo --gc --minify -d docs
