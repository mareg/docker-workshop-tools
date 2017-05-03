FROM phusion/baseimage

MAINTAINER YOUR NAME <YOUR EMAIL>

# Housekeeping tasks
CMD ["/sbin/my_init"]

# Install latest community nginx
RUN apt-get update && apt-get install -y python-software-properties
RUN add-apt-repository ppa:nginx/stable
RUN apt-get update && apt-get install -y nginx

# Configure nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# Copy start.sh into the container
RUN mkdir -p /etc/service/nginx
ADD start.sh /etc/service/nginx/run
RUN chmod +x /etc/service/nginx/run

# Expose HTTP port
EXPOSE 80

# Remove unused files
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
