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

cd /home/${USER_NAME}
su ${USER_NAME} -c "code-server"