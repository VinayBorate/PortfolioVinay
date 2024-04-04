# Use the official Nginx image as the base image
FROM nginx:alpine

# Copy the contents of the 'html' directory (which contains your index.html) into the Nginx default serving directory
COPY . /usr/share/nginx/html

# Expose port 80 to allow outside access to the web server running inside the container
EXPOSE 80

# Command to start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
