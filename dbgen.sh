SF=10

dbgen -vf -s $SF
dbgen -vf -T p -s $SF
dbgen -vf -T l -s $SF
dbgen -vf -T d -s $SF

demo-ssb.sh
docker.sh
pdk.sh
start-pilosa-cluster.sh
config.toml
dbgen.sh


demo-ssb -p 01.pilosa.local:10101 -i ssb

* Taxi usecase

pdk taxi
pdk taxi -i taxi-big -f usecase/taxi/greenAndYellowUrls.txt

* SSB

** Generating SSB data

dbgen -vf -T l

** Import data into Pilosa.

pdk ssb -p 01.pilosa.local:10101 -d .

** Run demo-ssb

demo-ssb -p 01.pilosa.local:10101 -i ssb

.spm
each:line

***
make test

pilosa server -d /data --bind 0.0.0.0:10101

TODO sht docker exec
docker exec -it 20 sh
pdk taxi

TODO
10101
8000 console
8000 demo-ssb
