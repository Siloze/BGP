build:
	sudo docker build -t busy .

run:
	sudo docker run -d --name busy busy

exec:
	sudo docker exec -it busy /bin/bash

all: build run exec

clean:
	sudo docker system prune -af
	sudo docker rm -f $$(docker ps -aq)

re: clean all

.PHONY: build run exec all clean re 