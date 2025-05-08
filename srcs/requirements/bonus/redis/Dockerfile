FROM debian:12

# Copy install script and run it during build
COPY tools/Script.sh /usr/local/bin/install_redis.sh
RUN chmod +x /usr/local/bin/install_redis.sh && /usr/local/bin/install_redis.sh

# Expose Redis port
EXPOSE 6379

# Start Redis when container runs
CMD ["redis-server", "--protected-mode", "no"]
