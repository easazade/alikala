#!/bin/bash

docker exec -it shop_server_postgres_1 psql -U postgres

# make sure file has execution permission -> chmod +x ./psql.sh