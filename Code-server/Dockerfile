ARG BASE_VERSION=latest
FROM da864268/my-ubuntu:${BASE_VERSION}

LABEL maintainer="da864268@naver.com"
LABEL description="code-server"

RUN apt update && apt upgrade -y
RUN apt install sudo -y

ARG USER_NAME=docker

# ubuntu 계정 지우고 다른 계정 추가
RUN userdel -rf ubuntu; \ 
adduser --disabled-password ${USER_NAME}

# sudo 권한 부여
RUN usermod -aG sudo ${USER_NAME} && \
echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd

RUN curl -fsSL https://code-server.dev/install.sh | sh

USER ${USER_NAME}
WORKDIR "/home/${USER_NAME}"

CMD ["bash", "-c", "code-server; bash"]