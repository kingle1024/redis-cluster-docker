#!/bin/bash

# Redis 인스턴스 실행 (마스터)
redis-server --port 6379 --cluster-enabled yes --cluster-config-file /data/nodes-6379.conf --cluster-node-timeout 5000 &
redis-server --port 6380 --cluster-enabled yes --cluster-config-file /data/nodes-6380.conf --cluster-node-timeout 5000 &
redis-server --port 6381 --cluster-enabled yes --cluster-config-file /data/nodes-6381.conf --cluster-node-timeout 5000 &

# Redis 인스턴스 실행 (레플리카)
redis-server --port 6382 --cluster-enabled yes --cluster-config-file /data/nodes-6382.conf --cluster-node-timeout 5000 --slaveof 127.0.0.1 6379 &
redis-server --port 6383 --cluster-enabled yes --cluster-config-file /data/nodes-6383.conf --cluster-node-timeout 5000 --slaveof 127.0.0.1 6380 &
redis-server --port 6384 --cluster-enabled yes --cluster-config-file /data/nodes-6384.conf --cluster-node-timeout 5000 --slaveof 127.0.0.1 6381 &

# 모든 Redis 인스턴스가 실행될 때까지 대기
sleep 5

# 클러스터 구성
redis-cli --cluster create \
127.0.0.1:6379 \
127.0.0.1:6380 \
127.0.0.1:6381 \
127.0.0.1:6382 \
127.0.0.1:6383 \
127.0.0.1:6384 \
--cluster-replicas 1

# 모든 Redis 인스턴스가 실행될 때까지 대기
wait
