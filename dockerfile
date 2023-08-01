# Use the official httpd base image
FROM httpd:2.4

# Copy your custom configuration files to the Apache configuration directory

# Copy your web application files to the Apache document root directory


# Expose port 80 (the default HTTP port)
EXPOSE 80

# Set the command to start the Apache server when the container starts
CMD ["httpd", "-D", "FOREGROUND"]
1-11000000000000000000000000000000
