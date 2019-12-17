source ../.env

INDEX=patients

logger_run() {
    echo "[INFO] RUN: $*" && eval "$*"
    return_value=$?
    if [ "$return_value" != "0" ]; then
        echo "[ERROR] \"$*\" STOPPED WITH EXIT CODE $return_value."
        exit $return_value
    fi
}

pql_query() {
    echo "index/${INDEX}: $1"
    echo -n "result: "
    curl -s ${endpoint}/index/${INDEX}/query \
         -X POST \
         -d "$1"
    echo
}

pql_query 'Min(field="age")'
pql_query 'Row(age > 40)'
pql_query 'Sum(field="age")'
pql_query 'Sum(Row(age > 40), field="age")'
pql_query 'Min(field="age")'
pql_query 'Min(Row(age > 40), field="age")'
