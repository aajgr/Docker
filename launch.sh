#!/bin/bash
docker run -v ${HOME}/.aws:/.aws -it -d --name awsrotatekey aajgr/awsrotatekey bash

sleep .5

docker exec -it awsrotatekey bash
