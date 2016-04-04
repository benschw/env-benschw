#!/bin/bash

fl_help() {
	echo "USAGE:"
	echo "    fl command"
	echo
	echo "COMMANDS:"
	echo "    up       short hand for \`run\` and \`migrate\`"
	echo "    logs     follow the logs for a container"
	echo "    destroy  stop a fliglio app"
	echo "    run      run a fliglio app"
	echo "    migrate  run database migrations on a running fliglio app"
	echo
	echo "CONFIG:"
	echo "    {"
	echo "        \"name\": \"container-name\","
	echo "        \"health\": \"/path/to/health-check\","
	echo "        \"db\": \"db_name\""
	echo "    }"
}



fl(){
	fl_$1
}

fl_up() {
	fl_run
	sleep 3
	fl_migrate
}

fl_run() {
	local name=$(fl_config_value "name")
	local health=$(fl_config_value "health")
	local docs=$(pwd)

	del_stopped $name

	relies_on registrator
	relies_on fabio

	sudo hostess add $name.fl 127.0.0.1

	docker run -d \
		-P\
		-e "SERVICE_80_CHECK_HTTP=${health}" \
		-e "SERVICE_80_NAME=${name}" \
		-e "SERVICE_80_TAGS=urlprefix-${name}.fl/,fl-app" \
		-v "${docs}:/var/www/" \
		--name $name \
		fliglio/local-dev
}

fl_migrate() {
	local name=$(fl_config_value "name")
	local docs=$(pwd)
	local db=$(fl_config_value "db")

	docker run \
		-v $docs:/var/www/ \
		-e "DB_NAME=$db" \
		--link ${name}:localdev \
		fliglio/local-dev \
		/usr/local/bin/migrate.sh
}

fl_logs() {
	docker logs -f $(fl_config_value "name")
}

fl_destroy() {
	del_all $(fl_config_value "name")
}

fl_config_value() {
	cat ./fl.json | jq -r ".$1"
}
