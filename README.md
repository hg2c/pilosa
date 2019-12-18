# Pilosa

## Prepare

### local pilosa
```bash
make start
```

### cluster
```bash
./start-pilosa-cluster.sh
./delete-pilosa-cluster.sh
```

### pilosa console

```bash
docker exec -d pilosa ./console.sh
```

## Pilosa Playground

```bash
# enter pilosa playground
docker exec -it pilosa sh

# config pilosa endpoint
./config endpoint localhost:10101
```

### patients

```bash
# create index patients and fields
./patients/create.sh

# import patients data
./patients/import.sh

# play
./patients/query.sh
```

### repository

```bash
# create index repository and fields
./repository/create.sh

# import repository data
./repository/import.sh

# play
./repository/query.sh
```

### taxi

```bash
# create index taxi and fields
./taxi/create.sh

# import taxi data
# https://www.pilosa.com/docs/latest/examples/
./taxi/import.sh

# play
./taxi/query.sh
```
