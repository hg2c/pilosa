FROM golang:1.13.0 as builder

RUN git clone https://github.com/pilosa/pdk.git
RUN cd pdk && CGO_ENABLED=0 make install FLAGS="-a"

FROM pilosa/pilosa:latest

COPY --from=builder /go/pdk /opt/pdk
COPY --from=builder /go/bin/pdk /pdk

ENV PATH="/:${PATH}"
WORKDIR /opt/pdk

ENTRYPOINT ["sh"]
