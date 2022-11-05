
# BASE
FROM alpine
# RUN
RUN apk add nginx;   
    #mkdir /run/nginx/; 
    #echo "<h1>Hellow world</h1>" > /var/www/localhost/htdocs/index.html;

# Add the html file 
#COPY . /usr/share/nginx/html;
#ADD #PWD/index/index.html /var/www/localhost/htdocs/index.html;  
#create path and add index.html
#WORKDIR /usr/share/nginx/html

# CONFIGUTATIONS
# nginx configuration
ADD $PWD/config/default.conf /etc/nginx/http.d/default.conf

# keys and certs
ADD $PWD/config/*.key /etc/ssl/private/
ADD $PWD/config/*.crt /etc/ssl/certs/
WORKDIR /var/www/localhost/htdocs

# ENTRYPOINT
COPY $PWD/config/entrypoint.sh /usr/local/bin

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/bin/sh", "/usr/local/bin/entrypoint.sh"]

# EXPOSE PORTS
EXPOSE 80

EXPOSE 443
# RUN COMMAND
CMD ["/bin/sh", "-c", "nginx -g 'daemon off;'; nginx -s reload;"]
