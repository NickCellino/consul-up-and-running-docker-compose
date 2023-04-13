.PHONY: install
install:
	if [ ! -d birdwatcher ]; then git clone git@github.com:consul-up/birdwatcher.git; fi
	make build

build:
	mkdir -p bin && \
	cd birdwatcher/backend && \
	GOOS=linux GOARCH=arm64 go build -o ../../bin/backend ./... && \
	cd ../frontend && \
	GOOS=linux GOARCH=arm64 go build -o ../../bin/frontend ./...

.PHONY: run
run:
	docker-compose up --force-recreate

.PHONY: getsh
getsh:
	docker-compose exec consul_server_0 bash

