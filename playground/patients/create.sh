curl localhost:10101/index/patients \
     -X POST

curl localhost:10101/index/patients/field/age \
     -X POST \
     -d '{"options":{"type": "int", "min": 0, "max": 120}}'

curl localhost:10101/index/patients/field/weight \
     -X POST \
     -d '{"options":{"type": "int", "min": 0, "max": 500}}'

curl localhost:10101/index/patients/field/tcells \
     -X POST \
     -d '{"options":{"type": "int", "min": 0, "max": 2000}}'
