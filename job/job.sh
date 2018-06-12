#!/bin/bash

source $root/config/config.sh

function BuildZzcmsTest(){
	set -x
	refspec=${1:-"origin/develop"}
	if [ "${refspec%%/*}" == "origin" ]; then
		refspec=$refspec
	else
		refspec=origin/$refspec
	fi
	stack_id=${2:-"1"}
	stage_name="zzcms-test"
	region="us-east-1"
	stack_name="cms-test"
	deployer="deployer-azft"
	curl -s -k -X POST $jenkins_host/job/AZ-CMS-test.dev/build \
		--user $jenkins_user:$jenkins_pswd \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"stack_id", "value":"'$stack_id'"},
					{"name":"stage_name", "value":"'$stage_name'"},
					{"name":"stack_name", "value":"'$stack_name'"},
					{"name":"region", "value":"'$region'"},
					{"name":"deployer", "value":"'$deployer'"}
				]
			}'
}
