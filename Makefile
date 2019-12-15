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
	docker run --name pilosa --rm -it -v $(CURDIR)/data:/data $(GROUP)/$(IMAGE):$(TAG)

.PHONY: start
start:
	docker run --rm --name pilosa \
		-p 10101:10101 -p 8000 \
		-v $(CURDIR)/pilosa:/opt/pilosa \
		hg2c/pilosa pilosa server
