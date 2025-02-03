# Use the official Node.js image from Docker Hub
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Install any dependencies (if you were using npm, for example)
RUN npm install -g http-server

# Expose port 8080
EXPOSE 8080

# Run a simple HTTP server to serve content
CMD ["http-server", "-p", "8080"]

