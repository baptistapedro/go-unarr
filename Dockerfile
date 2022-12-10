FROM golang:1.19.1-buster as go-target
ADD . /go-unarr
WORKDIR /go-unarr
RUN GOBIN=/go-unarr go install github.com/gen2brain/go-unarr/cmd/unarr@latest

FROM golang:1.19.1-buster
COPY --from=go-target /go-unarr/unarr /
COPY --from=go-target /go-unarr/testdata/test.* /testsuite/

ENTRYPOINT []
CMD ["/unarr", "@@", "."]
