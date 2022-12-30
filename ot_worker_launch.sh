#!/bin/bash

set -ex

sed "s/<PASSWORD>/$PASSWORD/;s/<HOSTNAME>/$REDIS_HOST/" $PWD/examples/config.fpga.yml > /tmp/config.fpga.yml
sed "s/<PASSWORD>/$PASSWORD/;s/<HOSTNAME>/$REDIS_HOST/" $PWD/examples/config.minimal.yml > /tmp/config.minimal.yml


bazel-6.0.0 run //src/main/java/build/buildfarm:buildfarm-shard-worker -- --jvm_flag=-Dlogging.config=file:$PWD/examples/logging.properties /tmp/config.fpga.yml &

bazel-6.0.0 run //src/main/java/build/buildfarm:buildfarm-shard-worker -- --jvm_flag=-Dlogging.config=file:$PWD/examples/logging.properties /tmp/config.minimal.yml
