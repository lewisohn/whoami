#!/bin/bash
for i in {1..10}
do
    curl -H Host:whoami.docker.localhost http://127.0.0.1:5000/api/whoami
    echo
done