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

alias notify-send=osd

osd(){
	relies_on notify_osd
	local args=${@:2}

	docker exec -i notify_osd notify-send "$1" "${args}"
}

