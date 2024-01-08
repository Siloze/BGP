init:
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt install -y vim make
	sudo apt-get install -y ca-certificates curl gnupg
	sudo install -m 0755 -d /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	sudo chmod a+r /etc/apt/keyrings/docker.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
	$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	sudo add-apt-repository ppa:gns3/ppa
	sudo apt update                                
	sudo apt install -y gns3-gui gns3-server
	sudo dpkg --add-architecture i386
	sudo apt update
	sudo apt install -y gns3-iou
	sudo usermod -aG docker $USER
	sudo usermod -aG wireshark $USER
	reboot

build: 
	sudo docker build -t frr -f Dockerfile.frr .
	sudo docker build -t busy -f Dockerfile.busy .

clean:
	sudo docker system prune -af
	sudo docker rm -f $$(docker ps -aq)

.PHONY: init build clean
