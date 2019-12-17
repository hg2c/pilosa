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

FROM pilosa/pilosa:latest as pilosa

FROM alpine:latest

RUN apk add --no-cache curl jq

ENV PILOSA_HOME="/opt/pilosa"
ENV PATH="${PILOSA_HOME}:${PATH}"

COPY --from=go /go/bin/pdk ${PILOSA_HOME}/pdk
COPY --from=go /go/bin/pilosa-console ${PILOSA_HOME}/pilosa-console
COPY --from=go /go/src/github.com/pilosa/demo-ssb/main ${PILOSA_HOME}/demo-ssb

COPY --from=alpine /ssb-dbgen/dbgen ${PILOSA_HOME}/dbgen
COPY --from=alpine /ssb-dbgen/dists.dss ${PILOSA_HOME}/dists.dss

COPY --from=pilosa /pilosa ${PILOSA_HOME}/pilosa

# COPY playground /playground
WORKDIR /playground

VOLUME /data
CMD ["sh"]
