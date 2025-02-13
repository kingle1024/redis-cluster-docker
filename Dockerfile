# Redis의 공식 이미지 사용
FROM redis:latest

# 여러 Redis 인스턴스를 실행하기 위한 스크립트 복사
COPY start-redis-cluster.sh /usr/local/bin/start-redis-cluster.sh
RUN chmod +x /usr/local/bin/start-redis-cluster.sh

# 스크립트를 실행하여 Redis 인스턴스를 시작
CMD ["/usr/local/bin/start-redis-cluster.sh"]
