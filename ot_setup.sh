#!/bin/bash

set -ex

docker run -d --rm --name buildfarm-redis -p 6379:6379 redis:5.0.9
redis-cli config set stop-writes-on-bgsave-error no
redis-cli requirepass $PASSWORD
