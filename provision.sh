#!/bin/sh

set -e
set -u

HOSTNAME="$(hostname)"
KEY_DIR=/vagrant/ssh_keys
VAGRANT_HOME=/home/vagrant
ROOT_HOME=/root

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
		ansible \
    make
	# J'ajoute les deux clefs sur le noeud de controle
	mkdir -p $VAGRANT_HOME/.ssh
	cp $KEY_DIR/projet_rsa $VAGRANT_HOME/.ssh/projet_rsa
	cp $KEY_DIR/projet_rsa.pub $VAGRANT_HOME/.ssh/projet_rsa.pub
	cp $KEY_DIR/github_rsa $VAGRANT_HOME/.ssh/github_rsa
	cp $KEY_DIR/github_rsa.pub $VAGRANT_HOME/.ssh/github_rsa.pub

  cat > $VAGRANT_HOME/.ssh/config <<MARK
Host github.com
      User git
      IdentityFile ~/.ssh/github_rsa

Host server*
      User root
      IdentityFile ~/.ssh/project_rsa
MARK

  chown -R vagrant:vagrant $VAGRANT_HOME/.ssh
  chmod 0600 $VAGRANT_HOME/.ssh/*_rsa
  chmod 0644 $VAGRANT_HOME/.ssh/config

	sed -i \
		-e '/## BEGIN PROVISION/,/## END PROVISION/d' \
		$VAGRANT_HOME/.bashrc
	cat >> $VAGRANT_HOME/.bashrc <<-MARK
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
192.168.50.10       s0.infra
192.168.50.20       s1.infra
192.168.50.30       s2.infra
192.168.50.40       s3.infra
192.168.50.50       s4.infra

## For testing purpose only :)
192.168.50.20       devops.com
192.168.50.20       devsec.com
192.168.50.20       devsecops.com 
## END PROVISION
MARK

# J'autorise la clef sur tous les serveurs
mkdir -p $ROOT_HOME/.ssh
cat $KEY_DIR/projet_rsa.pub >> $ROOT_HOME/.ssh/authorized_keys

# Je vire les duplicata (potentiellement gênant pour SSH)
sort -u $ROOT_HOME/.ssh/authorized_keys > $ROOT_HOME/.ssh/authorized_keys.tmp
mv $ROOT_HOME/.ssh/authorized_keys.tmp $ROOT_HOME/.ssh/authorized_keys

# Je corrige les permissions
touch $ROOT_HOME/.ssh/config
chmod 0600 $ROOT_HOME/.ssh/*
chmod 0644 $ROOT_HOME/.ssh/config
chmod 0700 $ROOT_HOME/.ssh

echo "SUCCESS."
