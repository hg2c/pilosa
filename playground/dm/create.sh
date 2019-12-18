curl localhost:10101/index/dm \
     -X POST

curl -XDELETE localhost:10101/index/user/field/language

curl localhost:10101/index/dm \
     -X POST

curl localhost:10101/index/dm/field/date \
     -X POST \
     -d '{"options":{"type": "time", "timeQuantum": "YMD", "cacheType": "ranked", "cacheSize":100000}}'
