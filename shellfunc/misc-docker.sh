#!/bin/bash

glances_docker() {
	del_stopped glances
	
	docker run \
		-v /var/run/docker.sock:/var/run/docker.sock:ro \
		--pid host \
		--name glances \
		-it docker.io/nicolargo/glances
}

htop_docker() {
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
		-v `pwd`:/home \
		-it benschw/tools
}
mysql-server-docker() {
	del_stopped mysqlserver

	docker run -d \
		-p 3306:3306 \
		--name mysqlserver \
		benschw/horde-mysql
}

ecr-pull() {
	local image="$1"

	if [ -z "${1+x}" ]; then
		echo "Usage: ecr-pull IMAGE"
		echo
		echo "   ex: ecr-pull kasasa/springboard:latest"
		return
	fi

	eval $(AWS_PROFILE=ops aws ecr get-login --registry-ids 304872096477 --no-include-email --region us-west-2)
	docker pull "304872096477.dkr.ecr.us-west-2.amazonaws.com/${image}"
	docker tag "304872096477.dkr.ecr.us-west-2.amazonaws.com/${image}" "${image}"
}

mysql-localdev() {
	echo Restarting mysql on port 3306
	HORDE_MYSQL_PUBLISH_PORT=3306 horde restart mysql

	echo Adding cimysql user
	docker run -it --rm --link mysql:mysql benschw/horde-mysql \
			sh -c 'exec mysql -h$MYSQL_PORT_3306_TCP_ADDR -u admin -pchangeme -e "GRANT ALL ON *.* TO cimysql@'\''%'\'' IDENTIFIED BY '\''cimysql-password'\'' WITH GRANT OPTION; FLUSH PRIVILEGES"'


}



