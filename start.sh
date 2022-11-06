#!/bin/bash
docker build . -t nginxssl
wait
docker run -it -d -p 80:80 -p 443:443 --name nginxnew nginxssl
wait
docker cp index/index/html nginxnew:/var/www/localhost/htdocs
