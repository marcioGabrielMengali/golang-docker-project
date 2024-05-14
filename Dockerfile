FROM golang:latest AS builder

WORKDIR /app

COPY ./app ./

RUN go run hello-world.go

RUN go build hello-world.go

FROM scratch

WORKDIR /app

COPY --from=builder ./app .

CMD [ "./hello-world" ]
