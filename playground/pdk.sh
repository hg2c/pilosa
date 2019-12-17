#!/usr/bin/env sh
source .env

run_pdk() {
    local PDK=/pdk
    cd /opt/pdk

    echo $PDK -p $endpoint $*
    $PDK -p $endpoint $*
}


if [ "$1" = "taxi-big" ]; then
    run_pdk taxi -i taxi-big -f /opt/pilosa/playground/taxi/greenAndYellowUrls.txt
    exit
fi

run_pdk $*
