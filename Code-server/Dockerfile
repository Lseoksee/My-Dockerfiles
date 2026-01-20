ARG BASE_VERSION=latest
FROM da864268/my-ubuntu:${BASE_VERSION}

LABEL maintainer="da864268@naver.com"
LABEL description="code-server"

RUN apt update && apt upgrade -y
RUN apt install sudo gosu -y

COPY ./init.sh /root/init.sh

RUN curl -fsSL https://code-server.dev/install.sh | sh

CMD [ "bash","-c", "\
if [ -f '/root/init.sh' ]; then \
    /root/init.sh; \
    rm -rf /root/init.sh; \
    cd /home/${USER_NAME}; \
    exec gosu \"$USER_NAME\" bash -c 'code-server; bash'; \
else \
    cd /home/${USER_NAME}; \
    exec gosu \"$USER_NAME\" bash -c 'code-server; bash'; \
fi"]