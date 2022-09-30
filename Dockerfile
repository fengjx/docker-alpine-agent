# Dockerfile for apollo quick start
# Build with:
# docker buildx build --platform linux/amd64,linux/arm64 -t fengjx/alpine-agent:[version] .
# Run with:

FROM alpine:3.16
LABEL maintainer="fengjx<https://github.com/fengjx>"

EXPOSE 22

COPY entrypoint.sh /entrypoint.sh

RUN echo "http://mirrors.aliyun.com/alpine/v3.16/main" > /etc/apk/repositories \
    && echo "http://mirrors.aliyun.com/alpine/v3.16/community" >> /etc/apk/repositories \
    && apk update upgrade \
    && apk add --no-cache netcat-openbsd curl bash openssh openrc python3 py3-pip \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && rc-update add sshd \
    && sed -i '/^#Port 22/s/^#//' /etc/ssh/sshd_config \
    && sed -i '/^#PasswordAuthentication/s/^#//' /etc/ssh/sshd_config \
    && sed -i '/^#PermitEmptyPasswords no/s/^#PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config \
    && sed -i '/^#PermitRootLogin prohibit-password/s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && chmod 755 /entrypoint.sh

ENTRYPOINT ["sh", "-c", "/entrypoint.sh"]
