FROM golang:1.20

WORKDIR /app

COPY /main.go .

RUN go mod init github.com/TheDevopsSchool/testing-the-go-app-app-1

RUN go mod tidy

# RUN go mod download && go mod verify

RUN go build main.go

EXPOSE 8080

CMD ["/app/main"]
