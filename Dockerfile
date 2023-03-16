# Start with a minimal golang image
FROM golang:1.17-alpine3.14 AS build

# Set the working directory
WORKDIR /app

# Copy the Go module files
COPY go.mod go.sum ./

# Download Go module dependencies
RUN go mod download

# Copy the source code
COPY . .

# Build the Go application
RUN go build -o app

# Create a new image from scratch
FROM alpine:3.14

# Set the working directory
WORKDIR /app

# Copy the Go application from the build stage
COPY --from=build /app/app .

# Expose the default HTTP port
EXPOSE 8080

# Run the Go application
CMD ["./app"]
