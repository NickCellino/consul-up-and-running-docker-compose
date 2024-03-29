.PHONY: install
install:
	git submodule update --init --recursive
	make build

build:
	mkdir -p bin && \
	cd ./birdwatcher/backend && \
	GOOS=linux go build -o ../../bin/backend ./... && \
	cd ../frontend && \
	GOOS=linux go build -o ../../bin/frontend ./...

.PHONY: run
run:
	docker-compose up --force-recreate

.PHONY: getsh
getsh:
	docker-compose exec consul_server_0 sh

.PHONY: restart
restart:
	docker-compose restart
