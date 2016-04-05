#!/bin/bash

consul() {
	ip=$(docker_bridge_ip)

	del_stopped consul

	docker run -d \
		-p 8500:8500 \
		--name=consul \
		--net=host \
		gliderlabs/consul-server:latest \
		-bootstrap \
		-advertise=$ip
}

registrator() {
	ip=$(docker_bridge_ip)

	del_stopped registrator
	
	relies_on consul

	docker run -d \
		--name=registrator \
		--net=host \
		--volume=/var/run/docker.sock:/tmp/docker.sock \
		gliderlabs/registrator:latest \
		-ip $ip\
		consul://localhost:8500 
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
