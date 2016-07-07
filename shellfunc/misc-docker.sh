#!/bin/bash

notify_osd(){
	del_stopped notify_osd

	docker run -d \
		-v /etc/localtime:/etc/localtime:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		--net none \
		-v /etc \
		-v /home/user/.dbus \
		-v /home/user/.cache/dconf \
		-e DISPLAY=unix$DISPLAY \
		--name notify_osd \
		jess/notify-osd
}


osd(){
	relies_on notify_osd
	docker exec -i notify_osd notify-send $@
}


pomodoro() {
	if [ "$1" == "log" ]; then
		cat ${HOME}/.pomodoro.log
		return
	fi

	echo -e $(date +"%Y.%m.%d %H:%M") "\t" $@ >> ${HOME}/.pomodoro.log

	relies_on notify_osd
	
	docker exec -i notify_osd notify-send  -t 0 '25 minutes are up'

}

glances() {
	del_stopped glances
	
	docker run \
		-v /var/run/docker.sock:/var/run/docker.sock:ro \
		--pid host \
		--name glances \
		-it docker.io/nicolargo/glances
}

docker-tools() {
	del_stopped docker-tools
	
	docker run \
		--name docker-tools \
		-it benschw/tools
}
