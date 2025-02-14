# Redis의 공식 이미지 사용
FROM redis:latest

# /data 디렉토리 생성 (이미 존재하는 경우 무시)
RUN mkdir -p /data

# Redis 프로세스가 사용할 수 있도록 /data 디렉토리의 권한을 변경
RUN chmod 777 /data

# 여러 Redis 인스턴스를 실행하기 위한 스크립트 복사
COPY start-redis-cluster.sh /usr/local/bin/start-redis-cluster.sh
RUN chmod +x /usr/local/bin/start-redis-cluster.sh

# Redis 설정 파일 복사
COPY redis.conf /usr/local/etc/redis/redis.conf

# 포트 노출
EXPOSE 6379 6380 6381 6382

# 루트 사용자로 Redis 실행
USER root

# 스크립트를 실행하여 Redis 인스턴스를 시작
CMD ["/usr/local/bin/start-redis-cluster.sh"]
