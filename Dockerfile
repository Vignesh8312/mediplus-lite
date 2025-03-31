# Use the official Nginx image as the base image
FROM nginx:latest

# Remove the default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy your application files to the nginx web server directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
