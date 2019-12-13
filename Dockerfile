FROM golang:1.13.0 as go

RUN git clone https://github.com/pilosa/pdk.git
RUN cd pdk && CGO_ENABLED=0 make install FLAGS="-a"


FROM hg2c/alpine:latest as alpine

RUN git clone https://github.com/greenlion/ssb-dbgen.git
RUN cd ssb-dbgen && make

FROM pilosa/pilosa:latest

COPY --from=go /go/pdk /opt/pdk
COPY --from=go /go/bin/pdk /opt/pdk/pdk

COPY --from=alpine /ssb-dbgen/dbgen /opt/ssb-dbgen/dbgen
COPY --from=alpine /ssb-dbgen/dists.dss /opt/ssb-dbgen/dists.dss

RUN ln -s /opt/pdk/pdk /usr/local/bin/pdk && \
  ln -s /opt/ssb-dbgen/dbgen /usr/local/bin/dbgen && \
  ln -s /pilosa /usr/local/bin/pilosa

WORKDIR /opt/pdk

ENTRYPOINT ["sh"]
