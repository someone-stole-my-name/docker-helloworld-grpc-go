FROM golang:1.18 as base

RUN git clone https://github.com/grpc/grpc-go.git && \
    cd grpc-go/examples && \
    go build -tags osusergo,netgo helloworld/greeter_server/main.go

FROM scratch
COPY --from=base /go/grpc-go/examples/main /bin/helloworld
ENTRYPOINT ["/bin/helloworld"]

