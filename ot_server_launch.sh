#!/bin/bash

set -ex

sed "s/<PASSWORD>/$PASSWORD/;s/<HOSTNAME>/$REDIS_HOST/" $PWD/examples/config.server.yml > /tmp/config.server.yml

bazel-6.0.0 run //src/main/java/build/buildfarm:buildfarm-server -- --jvm_flag=-Dlogging.config=file:$PWD/examples/logging.properties /tmp/config.server.yml
