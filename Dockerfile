FROM golang:1.13.0 as go
RUN go get -u github.com/golang/dep/cmd/dep

ENV PILOSA_HOME /go/src/github.com/pilosa

RUN git clone https://github.com/pilosa/pdk.git ${PILOSA_HOME}/pdk
RUN cd ${PILOSA_HOME}/pdk && CGO_ENABLED=0 make install FLAGS="-a"

RUN git clone https://github.com/pilosa/console.git ${PILOSA_HOME}/console
RUN cd ${PILOSA_HOME}/console && CGO_ENABLED=0 make install-statik install FLAGS="-a"

RUN git clone https://github.com/lotreal/demo-ssb.git ${PILOSA_HOME}/demo-ssb
RUN cd ${PILOSA_HOME}/demo-ssb && dep ensure && CGO_ENABLED=0 go build *.go


FROM hg2c/alpine:latest as alpine

RUN git clone https://github.com/greenlion/ssb-dbgen.git
RUN cd ssb-dbgen && make


FROM pilosa/pilosa:latest

ENV PATH="/:${PATH}"

COPY --from=go /go/bin/pdk /pdk
COPY --from=go /go/bin/pilosa-console /pilosa-console
COPY --from=go /go/src/github.com/pilosa/demo-ssb/main /demo-ssb
COPY --from=go /go/src/github.com/pilosa/pdk /opt/pdk

COPY --from=alpine /ssb-dbgen/dbgen /opt/ssb-dbgen/dbgen
COPY --from=alpine /ssb-dbgen/dists.dss /opt/ssb-dbgen/dists.dss

WORKDIR /opt/pdk

ENTRYPOINT []
CMD ["sh"]
