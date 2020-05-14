#!/bin/bash
ls -a
docker build -t lewisohn/whoami:0.1.6 .
docker push lewisohn/whoami:0.1.6
docker tag lewisohn/whoami:0.1.6 lewisohn/whoami:latest
docker push lewisohn/whoami:latest
