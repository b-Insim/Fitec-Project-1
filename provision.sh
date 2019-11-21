#!/bin/sh

set -e
set -u

HOSTNAME="$(hostname)"

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    git \
    curl \
    wget \
    vim \
    gnupg2 \
    python3 \
    software-properties-common

if [ "$HOSTNAME" = "control" ]; then
	apt-get install -y \
		ansible
	# J'ajoute les deux clefs sur le noeud de controle
	mkdir -p /root/.ssh
	cp /vagrant/ssh_keys/projet_rsa /home/vagrant/.ssh/projet_rsa
	cp /vagrant/ssh_keys/projet_rsa.pub /home/vagrant/.ssh/projet_rsa.pub
	cp /vagrant/ssh_keys/github_rsa /home/vagrant/.ssh/github_rsa
	cp /vagrant/ssh_keys/github_rsa.pub /home/vagrant/.ssh/github_rsa.pub
	chmod 0600 /home/vagrant/.ssh/*_rsa # ICI
	chown -R vagrant:vagrant /home/vagrant/.ssh

  cat /home/vagrant/.ssh/config <<-MARK
    Host github.com
      User git
      IdentityFile ~/.ssh/github_rsa

    Host server*
      User root
      IdentityFile ~/.ssh/project_rsa
  MARK

  chmod 0644 /home/vagrant/.ssh/config

	sed -i \
		-e '/## BEGIN PROVISION/,/## END PROVISION/d' \
		/home/vagrant/.bashrc
	cat >> /home/vagrant/.bashrc <<-MARK
	## BEGIN PROVISION
	eval \$(ssh-agent -s)
	ssh-add ~/.ssh/projet_rsa
	ssh-add ~/.ssh/github_rsa
	## END PROVISION
	MARK
fi

sed -i \
	-e '/^## BEGIN PROVISION/,/^## END PROVISION/d' \
	/etc/hosts
cat >> /etc/hosts <<MARK
## BEGIN PROVISION
192.168.50.250      control
192.168.50.10       server0
## END PROVISION
MARK

# J'autorise la clef sur tous les serveurs
mkdir -p /root/.ssh
cat /vagrant/projet_rsa.pub >> /root/.ssh/authorized_keys

# Je vire les duplicata (potentiellement gênant pour SSH)
sort -u /root/.ssh/authorized_keys > /root/.ssh/authorized_keys.tmp
mv /root/.ssh/authorized_keys.tmp /root/.ssh/authorized_keys

# Je corrige les permissions
touch /root/.ssh/config
chmod 0600 /root/.ssh/*
chmod 0644 /root/.ssh/config
chmod 0700 /root/.ssh

echo "SUCCESS."
