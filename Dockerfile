#build stage
FROM golang:alpine AS builder
RUN mkdir /build
WORKDIR /build

RUN export GO111MODULE=on
RUN go build -o /go/bin/app -v ./...

#final stage
FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=builder /go/bin/app /app
ENTRYPOINT /app
LABEL Name=pruebas Version=0.0.1
EXPOSE 3000
