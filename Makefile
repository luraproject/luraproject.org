.PHONY: install start build-assets

install:
	docker run -it -v ${PWD}:/app -w /app node:10 npm install

start:
	docker run -it -v ${PWD}:/site -p "1313:1313" alombarte/hugo hugo server --bind 0.0.0.0
