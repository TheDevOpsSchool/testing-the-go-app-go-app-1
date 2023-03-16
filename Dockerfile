# Use the official Golang image
FROM golang:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the source code into the container
COPY . 

# Build the Go application
RUN go build -o main .

# Expose the port the application listens on
EXPOSE 8080

# Set the entrypoint for the container
ENTRYPOINT ["./main"]
