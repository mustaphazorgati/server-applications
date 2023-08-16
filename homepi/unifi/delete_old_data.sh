#!/bin/bash
REL=$(dirname "$0")
docker compose -f "$REL/../compose.yml" exec -it unifi-controller bash -c 'mongo --port 27117 < "/run/mongo_prune_js.js"'
