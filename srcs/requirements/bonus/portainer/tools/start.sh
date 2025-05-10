#!/bin/sh

set -e

# Start Portainer in the background
/app/portainer --data /data &
PORTAINER_PID=$!

# Wait for the Portainer API to be ready
echo "Waiting for Portainer API..."
until curl -sf http://localhost:9443/api/status > /dev/null; do
  sleep 1
done

# Check if the admin user is initialized via API (not file)
if curl -sf http://localhost:9443/api/users/admin/check | grep true > /dev/null; then
  echo "Admin user already initialized."
else
  echo "Initializing Portainer admin user..."
  curl -s -X POST http://localhost:9443/api/users/admin/init \
    -H "Content-Type: application/json" \
    -d '{"Username": "admin", "Password": "adminpassword123"}'
  echo "Admin user created."
fi

# Kill temporary Portainer process
kill $PORTAINER_PID
wait $PORTAINER_PID 2>/dev/null

# Start Portainer for real
echo "Starting Portainer with SSL..."
exec /app/portainer --data /data --ssl
