# Redis의 공식 이미지 사용
FROM redis:latest

# /data 디렉토리 생성
RUN mkdir /data

# Redis 프로세스가 사용할 수 있도록 /data 디렉토리의 권한을 변경
RUN chmod 777 /data

# 여러 Redis 인스턴스를 실행하기 위한 스크립트 복사
COPY start-redis-cluster.sh /usr/local/bin/start-redis-cluster.sh
RUN chmod +x /usr/local/bin/start-redis-cluster.sh

# 스크립트를 실행하여 Redis 인스턴스를 시작
CMD ["/usr/local/bin/start-redis-cluster.sh"]
