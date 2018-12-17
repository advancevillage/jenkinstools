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

function BuildEditorProd(){
	refspec=${1:-"origin/develop"}
	if [ "${refspec%%/*}" == "origin" ]; then
		refspec=$refspec
	else
		refspec=origin/$refspec
	fi
	stack_id=0
	stage_name="zzeditor-prod"
	region="us-east-1"
	stack_name="cms-prod"
	deployer="deployer-zz-01"
	curl -s -k -X POST $jenkins_host/job/ZZEditor-prod.dev/build \
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

function BuildFeedProd(){
	refspec=${1:-"origin/develop"}
	if [ "${refspec%%/*}" == "origin" ]; then
		refspec=$refspec
	else
		refspec=origin/$refspec
	fi
	stack_id=0
	stage_name="azfeed-prod"
	region="us-east-1"
	stack_name="cms-prod"
	deployer="deployer-zz-01"
	curl -s -k -X POST $jenkins_host/job/ZZFeed-prod.dev/build \
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

function BuildNewsletterProd(){
	refspec=${1:-"origin/develop"}
	if [ "${refspec%%/*}" == "origin" ]; then
		refspec=$refspec
	else
		refspec=origin/$refspec
	fi
	stack_id=0
	stage_name="zznl-prod"
	region="us-east-1"
	stack_name="cms-prod"
	deployer="deployer-zz-01"
	curl -s -k -X POST $jenkins_host/job/ZZNewsLetter-prod.dev/build \
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

function BuildAdmktProd(){
	refspec=${1:-"origin/develop"}
	if [ "${refspec%%/*}" == "origin" ]; then
		refspec=$refspec
	else
		refspec=origin/$refspec
	fi
	stack_id=1
	stage_name="admkt-prod"
	region="us-east-1"
	stack_name="admkt-prod"
	deployer="deployer-zz-01"
	curl -s -k -X POST $jenkins_host/view/AZ-PROD/job/AZ-PC-ADMKT-prod.dev/build \
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
	refspec=${1:-"develop"}
	appname="erp"
	type="prod"
	distenv="erp"
	deployer="deployer-erp-prod"
	curl -s -k -X POST $jenkins_erp_host/view/7.ERP/job/erp.prod.pipeline.deploy/build \
		--user $jenkins_erp_user:$jenkins_erp_pswd \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"appname", "value":"'$appname'"},
					{"name":"type", "value":"'$type'"},
					{"name":"distenv", "value":"'$distenv'"},
					{"name":"deployer", "value":"'$deployer'"}
				]
			}' > /dev/null 2>&1
	echo "echo $?"
}

function BuildErpPre(){
	refspec=${1:-"develop"}
	appname="erp"
	type="pre"
	distenv="erp-pre"
	deployer="deployer-erp-prod"
	curl -s -k -X POST $jenkins_erp_host/view/7.ERP/job/erp.pre.pipeline.deploy/build \
		--user $jenkins_erp_user:$jenkins_erp_pswd \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"appname", "value":"'$appname'"},
					{"name":"type", "value":"'$type'"},
					{"name":"distenv", "value":"'$distenv'"},
					{"name":"deployer", "value":"'$deployer'"}
				]
			}' > /dev/null 2>&1
	echo "echo $?"
}

function BuildShieldProd(){
	refspec=${1:-"develop"}
	appname="shield"
	type="prod"
	distenv="shield"
	deployer="deployer-erp-prod"
	curl -s -k -X POST $jenkins_erp_host/view/7.ERP/job/shield.prod.pipeline.deploy/build \
		--user $jenkins_erp_user:$jenkins_erp_pswd \
		$curl_proxy_opt \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"appname", "value":"'$appname'"}, 
					{"name":"type", "value":"'$type'"},
					{"name":"distenv", "value":"'$distenv'"},
					{"name":"deployer", "value":"'$deployer'"}
				]
			}' > /dev/null 2>&1
	echo "echo $?"
}

function BuildMpsProd(){
	refspec=${1:-"develop"}
	appname="mps"
	type="prod"
	distenv="mps"
	deployer="deployer-erp-prod"
	curl -s -k -X POST $jenkins_erp_host/view/7.ERP/job/mps.prod.pipeline.deploy/build \
		--user $jenkins_erp_user:$jenkins_erp_pswd \
		$curl_proxy_opt \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"appname", "value":"'$appname'"},
					{"name":"type", "value":"'$type'"},
					{"name":"distenv", "value":"'$distenv'"},
					{"name":"deployer", "value":"'$deployer'"}
				]
			}' > /dev/null 2>&1
	echo "echo $?"
}

function BuildMpsPre(){
	refspec=${1:-"develop"}
	appname="appname"
	type="pre"
	distenv="mps-pre"
	deployer="deployer-erp-prod"
	curl -s -k -X POST $jenkins_erp_host/view/7.ERP/job/mps.pre.pipeline.deploy/build \
		--user $jenkins_erp_user:$jenkins_erp_pswd \
		$curl_proxy_opt \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"appname", "value":"'$appname'"},
					{"name":"type", "value":"'$type'"},
					{"name":"distenv", "value":"'$distenv'"},
					{"name":"deployer", "value":"'$deployer'"}
				]
			}' > /dev/null 2>&1
	echo "echo $?"
}

function BuildRomeoProd(){
	refspec=${1:-"develop"}
	appname="romeo"
	type="prod"
	distenv="romeo"
	deployer="deployer-erp-prod"
	curl -s -k -X POST $jenkins_erp_host/view/7.ERP/job/romeo.prod.pipeline.deploy/build \
		--user $jenkins_erp_user:$jenkins_erp_pswd \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"appname", "value":"'$appname'"}, 
					{"name":"type", "value":"'$type'"},
					{"name":"distenv", "value":"'$distenv'"},
					{"name":"deployer", "value":"'$deployer'"}
				]
			}' > /dev/null 2>&1
	echo "echo $?"
}

function BuildFhlProd(){
	refspec=${1:-"origin/develop"}
	if [ "${refspec%%/*}" == "origin" ]; then
		refspec=$refspec
	else
		refspec=origin/$refspec
	fi
	env="prod"
	stack_name="zz-logman-prod"
	deployer="deployer-zz-01"
	curl -s -k -X POST $jenkins_host//view/ERP/job/ERP-FHL-prod.dev/build \
		--user $jenkins_user:$jenkins_pswd \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"env", "value":"'$env'"},
					{"name":"stack_name", "value":"'$stack_name'"},
					{"name":"deployer", "value":"'$deployer'"}
				]
			}' > /dev/null 2>&1
	echo "echo $?"
}

function BuildFhlPre(){
	refspec=${1:-"origin/develop"}
	if [ "${refspec%%/*}" == "origin" ]; then
		refspec=$refspec
	else
		refspec=origin/$refspec
	fi
	env="pre"
	stack_name="zz-logman-prod"
	deployer="deployer-zz-01"
	curl -s -k -X POST $jenkins_host//view/ERP/job/ERP-FHL-prod.dev/build \
		--user $jenkins_user:$jenkins_pswd \
		--data-urlencode json='
			{
				"parameter": [
					{"name":"refspec", "value":"'$refspec'"}, 
					{"name":"env", "value":"'$env'"},
					{"name":"stack_name", "value":"'$stack_name'"},
					{"name":"deployer", "value":"'$deployer'"}
				]
			}' > /dev/null 2>&1
	echo "echo $?"
}

