FROM python:2.7
RUN \
  apt update && apt install -y vim less openssh-server sudo && \
  mkdir -pv -m 755 /run/sshd && \
  curl https://bootstrap.pypa.io/get-pip.py | python && \
  pip install pyyaml && \
  ssh-keygen -A && \
  sed -i "s/#AuthorizedKeysFile/AuthorizedKeysFile/g" /etc/ssh/sshd_config && \
  adduser --disabled-password --gid 0 --home /home/git --shell /bin/bash git ; \
  su git -c "mkdir /home/git/.ssh && \
  ssh-keygen -t rsa -b 4096 -f /home/git/.ssh/id_rsa -P '' && \
  cp -p /home/git/.ssh/id_rsa.pub /home/git/.ssh/authorized_keys && \
  mkdir /home/git/gitwork.git && \
  cd /home/git/gitwork.git && \
  git init --bare"

VOLUME ["/home/git/.ssh", "/home/git/test.git/hooks"]
WORKDIR /home/git

CMD ["/usr/sbin/sshd", "-D"]
