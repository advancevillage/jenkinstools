#!/bin/bash

source $root/config/config.sh

function BuildZzcmsTest(){
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
			}' > /dev/null 2>&1
	echo "echo $?"
}

function BuildZzcmsProd(){
	refspec=${1:-"origin/develop"}
	if [ "${refspec%%/*}" == "origin" ]; then
		refspec=$refspec
	else
		refspec=origin/$refspec
	fi
	stack_id=0
	stage_name="zzcms-prod"
	region="us-east-1"
	stack_name="cms-prod"
	deployer="deployer-zz-01"
	curl -s -k -X POST $jenkins_host/job/ZZCMS-prod.dev/build \
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
			}' > /dev/null 2>&1
	echo "echo $?"
}

function BuildAzaziePre(){
	refspec=${1:-"origin/develop"}
	if [ "${refspec%%/*}" == "origin" ]; then
		refspec=$refspec
	else
		refspec=origin/$refspec
	fi
	stage_name="zz-prod"
	stack_name="zz-prod"
	region="us-east-1"
	deployer="deployer-zz-01"
	curl -s -k -X POST $jenkins_host/view/zz-pipeline/job/AZ-PC-prod.dev/build \
		--user $jenkins_user:$jenkins_pswd \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"stage_name", "value":"'$stage_name'"},
					{"name":"stack_name", "value":"'$stack_name'"},
					{"name":"region", "value":"'$region'"},
					{"name":"deployer", "value":"'$deployer'"}
				]
			}' > /dev/null 2>&1

	stage_name="mzz-prod"
	stack_name="mzz-prod"
	region="us-east-1"
	deployer="deployer-zz-01"
	curl -s -k -X POST $jenkins_host/view/mzz-pipeline/job/AZ-Mobile-prod.dev/build \
		--user $jenkins_user:$jenkins_pswd \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"stage_name", "value":"'$stage_name'"},
					{"name":"stack_name", "value":"'$stack_name'"},
					{"name":"region", "value":"'$region'"},
					{"name":"deployer", "value":"'$deployer'"}
				]
			}' > /dev/null 2>&1

	stage_name="zzapi-prod"
	stack_name="zzapi-prod"
	region="us-east-1"
	deployer="deployer-zz-01"
	curl -s -k -X POST $jenkins_host/view/zzapi-pipeline/job/AZ-API-prod.dev/build \
		--user $jenkins_user:$jenkins_pswd \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"stage_name", "value":"'$stage_name'"},
					{"name":"stack_name", "value":"'$stack_name'"},
					{"name":"region", "value":"'$region'"},
					{"name":"deployer", "value":"'$deployer'"}
				]
			}' > /dev/null 2>&1

	echo "echo $?"
}

function BuildErpProd(){
	refspec=${1:-"origin/develop"}
	if [ "${refspec%%/*}" == "origin" ]; then
		refspec=$refspec
	else
		refspec=origin/$refspec
	fi
	repo="ssh://git@192.168.0.27:7022/erp/erp.git"
	type="prod"
	distenv="erp"
	curl -s -k -X POST $jenkins_erp_host/view/7.ERP/job/erp.prod.git.deploy/build \
		--user $jenkins_erp_user:$jenkins_erp_pswd \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"repo", "value":"'$repo'"},
					{"name":"type", "value":"'$type'"},
					{"name":"distenv", "value":"'$distenv'"}
				]
			}' > /dev/null 2>&1
	echo "echo $?"
}

function BuildErpPre(){
	refspec=${1:-"origin/develop"}
	if [ "${refspec%%/*}" == "origin" ]; then
		refspec=$refspec
	else
		refspec=origin/$refspec
	fi
	repo="ssh://git@192.168.0.27:7022/erp/erp.git"
	type="prod"
	distenv="erp-pre"
	curl -s -k -X POST $jenkins_erp_host/view/7.ERP/job/erp.ppppppp.git.deploy/build \
		--user $jenkins_erp_user:$jenkins_erp_pswd \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"repo", "value":"'$repo'"},
					{"name":"type", "value":"'$type'"},
					{"name":"distenv", "value":"'$distenv'"}
				]
			}' > /dev/null 2>&1
	echo "echo $?"
}

function BuildShieldProd(){
	refspec=${1:-"origin/develop"}
	if [ "${refspec%%/*}" == "origin" ]; then
		refspec=$refspec
	else
		refspec=origin/$refspec
	fi
	repo="ssh://git@192.168.0.27:7022/erp/shield.git"
	type="prod"
	curl -s -k -X POST $jenkins_erp_host/view/7.ERP/job/shield.prod.git.deploy/build \
		--user $jenkins_erp_user:$jenkins_erp_pswd \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"repo", "value":"'$repo'"},
					{"name":"type", "value":"'$type'"}
				]
			}' > /dev/null 2>&1
	echo "echo $?"
}

function BuildMpsProd(){
	refspec=${1:-"origin/develop"}
	if [ "${refspec%%/*}" == "origin" ]; then
		refspec=$refspec
	else
		refspec=origin/$refspec
	fi
	repo="ssh://git@192.168.0.27:7022/erp/mps.git"
	type="prod"
	curl -s -k -X POST $jenkins_erp_host/view/7.ERP/job/mps.prod.git.deploy/build \
		--user $jenkins_erp_user:$jenkins_erp_pswd \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"repo", "value":"'$repo'"},
					{"name":"type", "value":"'$type'"}
				]
			}' > /dev/null 2>&1
	echo "echo $?"
}

function BuildMpsPre(){
	refspec=${1:-"origin/develop"}
	if [ "${refspec%%/*}" == "origin" ]; then
		refspec=$refspec
	else
		refspec=origin/$refspec
	fi
	repo="ssh://git@192.168.0.27:7022/erp/mps.git"
	type="pre"
	curl -s -k -X POST $jenkins_erp_host/view/7.ERP/job/mps.prod.git.deploy/build \
		--user $jenkins_erp_user:$jenkins_erp_pswd \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"repo", "value":"'$repo'"},
					{"name":"type", "value":"'$type'"}
				]
			}' > /dev/null 2>&1
	echo "echo $?"
}

function BuildRomeoProd(){
	refspec=${1:-"origin/develop"}
	if [ "${refspec%%/*}" == "origin" ]; then
		refspec=$refspec
	else
		refspec=origin/$refspec
	fi
	repo="ssh://git@192.168.0.27:7022/erp/romeo.git"
	type="prod"
	distenv="romeo"
	curl -s -k -X POST $jenkins_erp_host/view/7.ERP/job/romeo.prod.git.deploy/build \
		--user $jenkins_erp_user:$jenkins_erp_pswd \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"repo", "value":"'$repo'"},
					{"name":"type", "value":"'$type'"},
					{"name":"distenv", "value":"'$distenv'"}
				]
			}' > /dev/null 2>&1
	echo "echo $?"
}
