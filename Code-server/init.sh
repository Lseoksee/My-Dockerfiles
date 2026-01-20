if [ -z "${USER_NAME}" ]; then
    USER_NAME="docker"
fi

userdel -rf ubuntu
useradd -m -s /bin/bash ${USER_NAME}

# sudo 권한 부여
usermod -aG sudo ${USER_NAME}
echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd

mkdir -p /home/${USER_NAME}/.config/code-server
echo "bind-addr: ${BIND_ADDR}
auth: password
password: ${PASSWORD}
cert: false" > /home/${USER_NAME}/.config/code-server/config.yaml

chown -R ${USER_NAME}:${USER_NAME} /home/${USER_NAME}/.config