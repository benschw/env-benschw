#!/bin/bash



aws_env_credentials_sections() {
	python -c "import sys, ConfigParser; from os.path import expanduser; c = ConfigParser.ConfigParser(); c.read(expanduser(\"~\")+'/.aws/credentials'); print \"\n\".join(c.sections());"
}


aws_env_credentials_value() {
    profile=$1
	field=$2

	python -c "import sys, ConfigParser; from os.path import expanduser; c = ConfigParser.ConfigParser(); c.read(expanduser(\"~\")+'/.aws/credentials'); v = c.get(\"$profile\", \"$field\"); print v" 2>/dev/null
}

aws_env_status() {
	local key=$AWS_ACCESS_KEY_ID
	local secret=$AWS_SECRET_ACCESS_KEY
	
	profiles=( $(aws_env_credentials_sections) )
	
	for p in "${profiles[@]}"; do
		if [ "$p" != "default" ]; then
			local testKey=$(aws_env_credentials_value $p "aws_access_key_id")
			local testSecret=$(aws_env_credentials_value $p "aws_secret_access_key")
			if [ "$key" == "$testKey" ]; then
				if [ "$secret" == "$testSecret" ]; then
					echo $p
					return
				fi
			fi
		fi
	done
	echo Configured profile is invalid
}

aws_env_set_profile() {
	local profile=$1

	key=$(aws_env_credentials_value $profile "aws_access_key_id")
	secret=$(aws_env_credentials_value $profile "aws_secret_access_key")
			
	export "AWS_ACCESS_KEY_ID=$key" 
	export "AWS_SECRET_ACCESS_KEY=$secret"
}

aws-env() {
	local profile=$1

	case "$profile" in
		"" )
			aws_env_status
			;;
		* )
			aws_env_set_profile "$profile"
			aws_env_status
			;;
	esac
}
