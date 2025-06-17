# Use an official Ubuntu runtime as a parent image
FROM ubuntu:22.04

# Set environment variable for the port
ENV PORT=22

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl openssh-client bash && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose SSH port (optional, for reference — not actually used by sshx.io itself)
EXPOSE $PORT

# Start sshx client
CMD ["bash", "-c", "curl -sSf https://sshx.io/get | sh -s run"]
