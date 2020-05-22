# docker-alpine-ca-certs

> Build image - Docker alpine 3.* with ca-certificates

This is a small build image with ca-certificates. Ideal for golang applications.


You can extend it as follows:


```sh

FROM golang:1.14.3 as build_image

ADD ./ /app/
WORKDIR /app
RUN GOOS=linux GOARCH=386 go build -o main main.go

FROM stevelacy/alpine-ca:3.11.6

RUN apk --no-cache add ca-certificates
RUN mkdir /app
WORKDIR /app
COPY --from=build_image /app/main .

EXPOSE 3000
CMD ["./main"]
```
