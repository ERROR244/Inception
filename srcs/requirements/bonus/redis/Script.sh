#!/bin/bash
set -e

# Update and install Redis
apt-get update
apt-get install -y redis-server

# # Optional: enable Redis to run in the foreground
# sed -i 's/^supervised no/supervised systemd/' /etc/redis/redis.conf

# Clean up to reduce image size
apt-get clean
rm -rf /var/lib/apt/lists/*

