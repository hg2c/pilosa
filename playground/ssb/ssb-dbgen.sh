#!/usr/bin/env sh
./dbgen
./dbgen -T p
./dbgen -T d
./dbgen -T l

pdk ssb -d .
