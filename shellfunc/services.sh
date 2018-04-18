#!/bin/bash

# edit `/etc/systemd/system/multi-user.target.wants/docker.service` to contain:
# `ExecStart=/usr/bin/docker daemon --dns 172.17.0.1 -H fd://¬`
# and run `sudo systemctl daemon-reload` and `sudo service docker restart`

consul() {
	ip=$(docker_bridge_ip)

	del_stopped consul

	docker run -d \
		-p 8500:8500 \
		-p "$ip:53:8600/udp" \
		--name=consul \
		gliderlabs/consul-server:latest -bootstrap -advertise=$ip -recursor=8.8.8.8
}

registrator() {
	ip=$(docker_bridge_ip)

	del_stopped registrator
	
	relies_on consul

	docker run -d \
		--name=registrator \
		--net=host \
		--volume=/var/run/docker.sock:/tmp/docker.sock \
		gliderlabs/registrator:latest -ip $ip consul://localhost:8500
}

fabio() {
	ip=$(docker_bridge_ip)

	del_stopped fabio

	docker run -d \
		-p 80:9999 \
		-p 9998:9998 \
		-e "registry_consul_addr=${ip}:8500" \
		-e "SERVICE_IGNORE=true" \
		--name=fabio \
		magiconair/fabio
}

rabbitmq() {

	del_stopped rabbitmqlocal

	docker run -d \
		-p 5672:5672 \
		-p 15672:15672 \
		--name rabbitmqlocal \
		rabbitmq:3.6-management
}
