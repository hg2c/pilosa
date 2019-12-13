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
	docker run --rm -it $(GROUP)/$(IMAGE):$(TAG)
