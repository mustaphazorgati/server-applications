#!/bin/sh
REL="$(dirname "$0")"
docker compose -f "$REL/../compose.yml" exec -w /etc/caddy caddy caddy fmt --overwrite
docker compose -f "$REL/../compose.yml" exec -w /etc/caddy caddy caddy reload
