#!/bin/bash

export root=`dirname $0`

source $root/job/job.sh


PROJECT=
PLATFORM=
REFSPEC=
ID=

while [ $# -gt 0 ]; do
    opt=$1
    shift
    case "$opt" in
        azazie|zzcms|loveprom|zzeditor|erp|shell|mps|romeo) 
            PROJECT=$opt       
            ;;
        prod|pre|test)  
            PLATFORM=$opt        
            ;;
        feature/*|develop|release/*)
            REFSPEC=$opt
            ;;
        0|1|2|3|4|5|6|7|8|9)
            ID=$opt
            ;;
        *)
            echo "Usage $0 [azazie|zzcms|loveprom|zzeditor|erp|shell|mps|romeo] [prod|pre|test] refspec [ID]"
            exit 1
            ;;
    esac
done

job=Build${PROJECT^}${PLATFORM^}

echo $job
`$job`