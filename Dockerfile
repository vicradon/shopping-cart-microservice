# Use the official golang image as the base image for the build stage
FROM golang:1.17-alpine AS build

# Set the working directory to /app
WORKDIR /app

# Copy the source code to the working directory
COPY . .

# Build the Go application
RUN go build -o app .

# Stage 2: Final stage
FROM alpine:latest

# Copy the binary from the build stage
COPY --from=build /app/app .

# Expose port 8080 for the container
EXPOSE 8080

# Start the application
CMD ["./app"]