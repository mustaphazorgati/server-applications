#!/bin/bash
set -e
set -o pipefail
shopt -s inherit_errexit

REL="$(dirname "$0")"
DATA_DIR="/var/lib/docker/volumes/nextcloud_data/_data"

function occ {
  docker compose -f "$REL/../compose.yml" exec --user www-data -it nextcloud php occ "$@"
}

#occ
echo "Applying occ commands ..."
occ config:app:set files max_chunk_size --value 104857600

#object storage
echo "Adding custom.config.php ..."
sudo cp "$REL/custom.config.php" "/var/lib/docker/volumes/nextcloud/_data/config/"
sudo chown www-data:www-data "/var/lib/docker/volumes/nextcloud/_data/config/custom.config.php"

# delete default admin user and recreate admin user (on object storage)
echo "Deleting old admin user ..."
occ user:delete admin
sudo rm -rf "$DATA_DIR/admin"
echo "Creating new admin user ..."
occ user:add --display-name="Mustapha Zorgati" --group="admin" mustaphazorgati
occ user:setting mustaphazorgati settings email "zorgati.mustapha@gmail.com"
