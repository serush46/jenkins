# Save it as Dockerfile and run 
#docker build . -f Dockerfile -t dl:latest

FROM ubuntu
# Updating Ubuntu packages 
RUN apt-get update  

# Install Apache2 
RUN apt-get install -y apache2 && apt-get clean

# Configuring access to Jupyter 
RUN mkdir /opt/notebooks
RUN rm -rf /var/www/index.html

COPY deploymentfile /opt/notebooks/deploymentfile
COPY index.html /var/www/index.html

#Start port 80
EXPOSE 80

# Start Apache
ENTRYPOINT ["/usr/sbin/apache2", "-k", "start"]

