.PHONY: docker

docker:
	docker build . -t hg2c/pilosa:latest
