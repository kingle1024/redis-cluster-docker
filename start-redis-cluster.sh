#!/bin/bash

# Redis 인스턴스 실행
redis-server --port 6379 --cluster-enabled yes --cluster-config-file /data/nodes-6379.conf --cluster-node-timeout 5000 &
redis-server --port 6380 --cluster-enabled yes --cluster-config-file /data/nodes-6380.conf --cluster-node-timeout 5000 &
redis-server --port 6381 --cluster-enabled yes --cluster-config-file /data/nodes-6381.conf --cluster-node-timeout 5000 &

# 모든 Redis 인스턴스가 실행될 때까지 대기
wait
