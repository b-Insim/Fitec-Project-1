ls -al
ls .ssh/
cat .ssh/config 
ls /home/
ssh server0 
ssh root@server0 
exit
cat .ssh/projet_rsa.pub 
exit
cat .ssh/projet_rsa.pub 
ssh server0 
ssh root@server0 
exit
cat .ssh/config 
ssh root@server0 
vim .ssh/config 
ls -al .ssh/
sudo chown -R vagrant:vagrant .ssh
ls -al .ssh/
ssh root@server0 
vim .ssh/config 
ssh root@server0 
chmod 600 .ssh/projet_rsa
chmod 600 .ssh/projet_rsa.pub 
ssh root@server0 
exit
rm .ssh/config 
ls -al .ssh/
exit
ssh server0 
cat .ssh/config 
exit
cat .ssh/config 
exit
ssh server0 
clear
ssh server1
exit 
cat .ssh/config 
ssh server0 
git init .
git remote add origin git@github.com:b-Insim/Fitec-Project-1.git
git pull origin master
ls
ls -al
cd src/ansible/
ansible-playbook - inventories/infra.yml install.yml 
ansible-playbook -i inventories/infra.yml install.yml 
cd ~
vim Makefile
make
apt-get install make
sudo apt-get install make
make ansible 
clear 
make ansible 
clear 
ls
make ansible 
clear 
make ansible 
clear 
make ansible 
clear 
make ansible 
tree src/ansible/
sudo apt-get install tree
tree src/ansible/
ssh server0 ls -al /etc/
ssh server0 cat /etc/dnsmasq.conf
ip a
clear 
make ansible 
ms
ls
tree

make ansible 
clear 
make ansible 
tree
ls
vim Makefile 
clear 
make ansible 
clear 
make ansible 
clear 
make ansible 
clear 
make ansible 
clear 
make ansible 
clear 
make ansible 
clear 
make ansible 
ssh server0 
make
make ansible 
ssh server0 
make
make ansible 
ssh server0 
make ansible 
ssh server0 
make ansible 
ssh server0 
make ansible 
clear 
make ansible 
ssh server0 
ssh server1
clear 
make ansible 
ssh server0
clear 
make ansible 
clear 
make ansible 
clear 
make ansible 
clear 
make ansible 
ssh server0
make ansible 
clear 
make ansible 
clear 
ls
cd src/
ls
cd ansible/
ls
cat inventories/
cat inventories
cd inventories
ls
vim infra.yml 
cd ../
ls
cd roles/
ls
clear 
ls
ansible-galaxy init apache
ls
clear
ls
$ cd apache &&rm-r files meta templates vars defaults tests README.md
apache && rm-rf files meta templates vars defaults tests README.md
cd apache && rm-rf files meta templates vars defaults tests README.md
cd apache && rm-r files meta templates vars defaults tests README.md .
ls
rm -r files meta templates vars defaults tests README.md .
rm -rf files meta templates vars defaults tests README.md .
rm -rf files meta templates vars defaults tests README.md 
ls
cd ../
ls
clear 
tree apache/
x
clear 
ls
$ mkdir -p mariadb/tasks/
mkdir -p mariadb/tasks/
ls
$ touch mariadb/tasks/main.yml
touch mariadb/tasks/main.yml
ls
tree mariadb/
clear 
ls
mkdir -p NFS/tasks/
touch NFS/tasks/main.yml
mkdir -p haproxy/tasks/
ls
mkdir wordpress
mkdir -p wordpress/commun/defaults/
touch wordpress/commun/defaults/main.yml
tree
clear
mkdir -p wordpress/confbd/meta wordpress/confbd/tasks
touch wordpress/confbd/tasks/main.yml
touch wordpress/confbd/meta/main.yml
ls
cd wordpress/
ls
mkdir -p confapache/meta confapache/tasks
touch confapache/tasks/main.yml confapache/meta/main.yml
cd 
ls
cd src/ansible/roles/
ls
vim apache/
ls
cd apache/
ls
vi tasks/main.yml 
clear
ls
cd tasks/
ls
cat > main.yml ---
#1. Cette tâche permet d’installer Apache (httpd) à l’aide du module yum
- name: "apache installation"
name: "httpd"
state: "present"
#2. Cette tâche active le service Apache
- name: "apache service activation"
name: "httpd"
state: "started"
enabled: yes
#3. Cette tâche fait appel à un autre fichier de configuration pour installer PHP. Elle est exécutée uniquement si la variable php_install est à vraie (par défaut, elle est à faux)
- name: "install php7 packages"
clear 
vim main.yml 
---
#1. Cette tâche permet d’installer Apache (httpd) à l’aide du module yum
- name: "apache installation"
name: "httpd"
state: "present"
#2. Cette tâche active le service Apache
- name: "apache service activation"
name: "httpd"
state: "started"
enabled: yes
#3. Cette tâche fait appel à un autre fichier de configuration pour installer PHP. Elle est exécutée uniquement si la variable php_install est à vraie (par défaut, elle est à faux)
- name: "install php7 packages"
clear
vim main.yml 
clear 
cd 
ls
exit 
clear 
ls
cd src/ansible/roles/
ls
cd 
ls
git status
git add src/ansible/ .
git commit -m "my first real commit"
git push -u origin master 
git status
ls
git add  .
git  commit -m "first"
git log
ls
git add src/ansible/ .
ls
git status
git checkout branch -b ansible2
clear 
ls
git init
git commit -m "first commit"
git add  .
git commit -m "first commit"
git remote add origin git@github.com:b-Insim/ansibleprojet.git
git push -u origin master
git push origin master
git push 
git push --set-upstream origin master
git clone https://github.com/b-Insim/ansibleprojet.git
git add .
git commit -m "first commit"
git clone https://github.com/b-Insim/ansibleprojet.git
git push origin master
git push --set-upstream origin master
git push 
clear 
git remote add origin https://github.com/b-Insim/ansibleprojet.git
git push -u origin master
ls
cd ansibleprojet/
ls
cd
rm -r ansibleprojet/ 
clear
ls
git push -u origin master
git status
ls -a
git pull --rebase
pwd
exit
