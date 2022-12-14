### First Stage ###
FROM golang:1.14-alpine as build
WORKDIR /app
COPY . ./
RUN go build -o server .

################

### Second Stage ###
FROM alpine:3.12
COPY --from=build /app /app
WORKDIR /app
EXPOSE 8081
CMD ["/app/server"]
