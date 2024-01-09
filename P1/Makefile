build: 
	docker build -t router -f Dockerfile.router .
	docker build -t host -f Dockerfile.host .

clean:
	docker system prune -af
	docker rm -f $$(docker ps -aq)

.PHONY: init build clean
