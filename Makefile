GROUP ?= hg2c
IMAGE = pilosa
TAG ?= latest

.PHONY: build
build:
	docker build . -t $(GROUP)/$(IMAGE):$(TAG)

.PHONY: push
push:
	docker push $(GROUP)/$(IMAGE):$(TAG)

.PHONY: test
test:
	docker run --rm -it -v $(CURDIR)/data:/data $(GROUP)/$(IMAGE):$(TAG) sh

.PHONY: start
start:
	docker run -d \
		--name=pilosa --cpus=6 --memory=8g \
		-p 10101:10101 -p 8000:8000 -p 8080:8080 \
		-v $(CURDIR)/data:/data \
		-v $(CURDIR)/playground:/playground \
		hg2c/pilosa pilosa server -c config.toml

.PHONY: stop
stop:
	docker rm -f pilosa

.PHONY: sh
sh:
	docker exec -it pilosa sh

.PHONY: console
console:
	docker exec -d pilosa /playground/console.sh

.PHONY: info
info:
	curl -s localhost:10101/schema | jq
	curl -s localhost:10101/status | jq
