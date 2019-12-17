```bash
docker run --rm -it \
  --add-host 01.pilosa.local:10.0.0.11 \
  --add-host 02.pilosa.local:10.0.0.12 \
  --add-host 03.pilosa.local:10.0.0.13 \
  hg2c/pilosa demo-ssb -p 01.pilosa.local:10101 -i ssb
```

```bash
docker run --rm -it \
  --add-host 01.pilosa.local:10.0.0.11 \
  --add-host 02.pilosa.local:10.0.0.12 \
  --add-host 03.pilosa.local:10.0.0.13 \
  -v $(pwd):/data \
  hg2c/pilosa pdk ssb -d /data -p 01.pilosa.local:10101
```



# Taxi usecase

docker exec pilosa pdk.sh taxi
docker exec pilosa pdk.sh taxi-big

# SSB

## Generating SSB data

dbgen -vf -T l

## Import data into Pilosa.

pdk ssb -p 01.pilosa.local:10101 -d .

## Run demo-ssb

demo-ssb -p 01.pilosa.local:10101 -i ssb

.spm
each:line

###
make test

pilosa server -d /data --bind 0.0.0.0:10101

TODO sht docker exec
docker exec -it 20 sh
pdk taxi

TODO
10101
8000 console
8000 demo-ssb
