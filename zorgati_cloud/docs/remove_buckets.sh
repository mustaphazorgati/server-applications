#!/bin/sh
buckets=$(aws --endpoint-url https://eu2.contabostorage.com s3api list-buckets --query "Buckets[].Name[]" | jq -r '.[]' | grep nextcloud-)
echo "Detected buckets:"
echo "$buckets"
echo 

for bucket in $buckets; do
  echo deleting $bucket...
  aws --endpoint-url https://eu2.contabostorage.com s3 rb "s3://$bucket" --force
done
