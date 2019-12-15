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
