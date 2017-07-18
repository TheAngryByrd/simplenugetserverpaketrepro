#!/usr/bin/env bash

docker run --detach=true \
           --publish 5000:80 \
           --env NUGET_API_KEY=SECRETNUGETKEY \
           --volume /srv/docker/nuget/database:/var/www/db \
           --volume /srv/docker/nuget/packages:/var/www/packagefiles \
           --name nuget-server \
           sunside/simple-nuget-server