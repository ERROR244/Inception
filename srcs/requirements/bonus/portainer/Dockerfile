FROM debian:12

ENV PORTAINER_VERSION="2.27.6"
ENV TARGETARCH="amd64"

# Initial installation of dependencies
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    procps \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# Create application directory and data directory
RUN mkdir -p /data

# Download and extract Portainer
RUN curl -L https://github.com/portainer/portainer/releases/download/${PORTAINER_VERSION}/portainer-${PORTAINER_VERSION}-linux-${TARGETARCH}.tar.gz | tar zx \
    && mv /portainer /app

WORKDIR /app

# Copy the startup script
COPY tools/start.sh /app/
RUN chmod +x /app/start.sh

# Expose the necessary ports
EXPOSE 9443

CMD ["/app/start.sh"]
