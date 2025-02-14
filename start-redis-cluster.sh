#!/bin/bash

# Redis 인스턴스 실행 (마스터)
for port in 6379 6380 6381; do
  redis-server --port $port --cluster-enabled yes --cluster-config-file /data/nodes-$port.conf --cluster-node-timeout 5000 &
done

# Redis 인스턴스 실행 (레플리카)
# for port in 6382 6383 6384; do
#   redis-server --port $port --cluster-enabled yes --cluster-config-file /data/nodes-$port.conf --cluster-node-timeout 5000 &
# done

# 모든 Redis 인스턴스가 실행될 때까지 대기
sleep 5

# 클러스터 구성
redis-cli --cluster create \
127.0.0.1:6379 \
127.0.0.1:6380 \
127.0.0.1:6381 \
# 127.0.0.1:6382 \
# 127.0.0.1:6383 \
# 127.0.0.1:6384 \
--cluster-replicas 0

# 모든 Redis 인스턴스가 실행될 때까지 대기
wait
