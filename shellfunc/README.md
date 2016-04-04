


	if [ ! `which docker` ]; then
		wget -qO- https://get.docker.com/ | sh
		usermod -aG docker vagrant
		BRIDGE=$(ifconfig | grep -A 1 docker | tail -n 1 | awk -F: '{print $2}' | awk '{print $1}')
		echo "DOCKER_OPTS='--dns $BRIDGE --dns 8.8.8.8 --dns-search service.consul'" >> /etc/default/docker
		service docker restart
	fi



https://github.com/benschw/coreos-consul-cluster
http://gliderlabs.com/registrator/latest/user/run/
https://github.com/eBay/fabio#quickstart
