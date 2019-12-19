curl -XDELETE localhost:10101/index/dm

# curl localhost:10101/index/dm \
#      -X POST

# curl localhost:10101/index/dm/field/date \
#      -X POST \
#      -d '{"options":{"type": "time", "timeQuantum": "YMD" }}'
