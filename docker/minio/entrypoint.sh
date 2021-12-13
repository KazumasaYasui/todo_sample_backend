#!/usr/bin/env sh
set -e

PUBLIC_IMAGE_BUCKET="${PUBLIC_IMAGE_BUCKET:-}";

if [ -n "$PUBLIC_IMAGE_BUCKET" ]; then
  echo "$0: create directories for bucket and policy '$PUBLIC_IMAGE_BUCKET'";
  mkdir -p "/data/$PUBLIC_IMAGE_BUCKET" "/data/.minio.sys/buckets/$PUBLIC_IMAGE_BUCKET";

  echo "$0: create policy for bucket '$PUBLIC_IMAGE_BUCKET'";
  target_policy="/data/.minio.sys/buckets/$PUBLIC_IMAGE_BUCKET/policy.json";
  cp -f /opt/policy.json "$target_policy";

  sed -i "s|{#PUBLIC_IMAGE_BUCKET#}|$PUBLIC_IMAGE_BUCKET|g" "$target_policy";
fi;

# return control to the original file
/bin/sh /usr/bin/docker-entrypoint.sh "$@"
