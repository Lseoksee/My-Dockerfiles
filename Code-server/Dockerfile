ARG BASE_VERSION=latest
FROM da864268/my-ubuntu:${BASE_VERSION}

LABEL maintainer="da864268@naver.com"
LABEL description="code-server"

RUN apt update && apt upgrade -y
RUN apt install sudo -y

COPY ./init.sh /root/init.sh

RUN curl -fsSL https://code-server.dev/install.sh | sh

# ubuntu 계정 지우고 다른 계정 추가
CMD [ "bash","-c", "\
if [ -f '/root/init.sh' ]; then \
    /root/init.sh && rm -rf /root/init.sh \
else \
    code-server; \
fi"]