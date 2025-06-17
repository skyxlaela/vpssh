# Gunakan image dasar ringan
FROM alpine:latest

# Install tools yang dibutuhkan: curl, bash, dan openssh
RUN apk add --no-cache curl bash openssh

# Jalankan perintah sshx saat container start
CMD curl -sSf https://sshx.io/get | sh -s run
