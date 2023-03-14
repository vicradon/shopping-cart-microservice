# Use the official golang image as the base image
FROM golang:1.17-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the source code to the working directory
COPY . .

# Build the Go application
RUN go build -o app .

# Expose port 8080 for the container
EXPOSE 8080

# Start the application
CMD ["./app"]
