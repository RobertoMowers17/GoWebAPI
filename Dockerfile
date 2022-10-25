#build stage
FROM golang:alpine AS builder
RUN mkdir /build
WORKDIR /build

RUN export GO111MODULE=on
RUN go get -y https://github.com/RobertoMowers17/GoWebAPI/main
RUN cd /build && git clone https://github.com/RobertoMowers17/GoWebAPI.git 

#final stage
RUN cd /build/GoWebAPI/main && go build


EXPOSE 3000

ENTRYPOINT [ "/build/GoWebAPI/main" ]
