FROM golang:alpine AS builder

WORKDIR /app

COPY hello.go /app/hello.go

RUN go mod init davisonfav/fullcycle

RUN go build

###

FROM scratch

COPY --from=builder /app/fullcycle fullcycle

ENTRYPOINT ["./fullcycle"]