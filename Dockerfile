FROM golang:1.19.2-buster AS builder
WORKDIR /usr/local/src/
ADD go.mod ./
RUN go mod download
ADD . .
RUN go build -o /go/bin/cmd ./cmd/main.go

FROM alpine:latest
COPY --from=builder /go/bin/cmd /
CMD ["/cmd"]