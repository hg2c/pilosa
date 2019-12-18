# Pilosa

## 启动

```bash
docker run -d \
    --name=pilosa --cpus=6 --memory=8g \
    -p 10101:10101 -p 8000:8000 -p 8080:8080 \
    -v $(CURDIR)/data:/data \
    -v $(CURDIR)/playground:/playground \
    hg2c/pilosa pilosa server -c config.toml

# 或:
pilosa server -c config.toml
```

## 使用

### Taxi

```bash
docker exec pilosa pdk.sh taxi

# https://www.pilosa.com/docs/latest/examples/
# import all taxi data
docker exec pilosa pdk.sh taxi-big
```

### SSB

```bash
# Generating SSB data
dbgen -vf -T a

# Import data into Pilosa.
pdk ssb -d .

# Run demo-ssb
demo-ssb -i ssb
```
