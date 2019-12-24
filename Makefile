GROUP ?= hg2c
IMAGE = pilosa
TAG ?= latest
PDK_HOME := $(GOPATH)/src/github.com/pilosa/pdk

.PHONY: build
build:
	docker build -t $(GROUP)/$(IMAGE):$(TAG) --build-arg PDK_VERSION=v0.8.0-import.5 .

.PHONY: push
push:
	docker push $(GROUP)/$(IMAGE):$(TAG)

.PHONY: devel
devel:
	cd $(PDK_HOME) && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 make crossbuild
	cp $(PDK_HOME)/build/pdk-v0.8.0-devel-linux-amd64/pdk ./pdk-devel
	docker build . -t $(GROUP)/$(IMAGE):devel -f Dockerfile.devel
	docker push $(GROUP)/$(IMAGE):devel
	rm ./pdk-devel

.PHONY: test
test:
	docker run --rm -it -v $(CURDIR)/data:/data $(GROUP)/$(IMAGE):$(TAG) sh

.PHONY: test-devel
test-devel:
	docker run --rm -it -v $(CURDIR)/data:/data -v $(PDK_HOME):/app $(GROUP)/$(IMAGE):devel sh

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
