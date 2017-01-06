#!/bin/bash

glances() {
	del_stopped glances
	
	docker run \
		-v /var/run/docker.sock:/var/run/docker.sock:ro \
		--pid host \
		--name glances \
		-it docker.io/nicolargo/glances
}

htop() {
	del_stopped htop
	docker run --rm -it --pid host jess/htop
}

jq_test() {
	del_stopped jq
	docker run --rm -it jess/jq
}

spotify_test() {
	 docker run -d \
		-v /etc/localtime:/etc/localtime:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=unix$DISPLAY \
		--device /dev/snd:/dev/snd \
		-v $HOME/.spotify/config:/home/spotify/.config/spotify \
		-v $HOME/.spotify/cache:/home/spotify/spotify \
		--name spotify \
		jess/spotify

}

docker-tools() {
	del_stopped docker-tools
	
	docker run \
		--name docker-tools \
		-it benschw/tools
}
mysql-server-docker() {
	del_stopped mysqlserver

	docker run -d \
		-p 3306:3306 \
		--name mysqlserver \
		benschw/horde-mysql
}
