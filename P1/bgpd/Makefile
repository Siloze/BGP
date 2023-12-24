clean:
	docker system prune -af
	docker rm -f $$(docker ps -aq)

build:
	docker build -t bgpd .

run:
	docker run -d --name bgpd bgpd

exec:
	docker exec -it bgpd /bin/bash

all: build run exec

re: clean all

.PHONY: clean build run exec all re