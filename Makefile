all:

ansible:
	git pull origin master
	cd src/ansible && ansible-playbook -i inventories/infra.yml install.yml \
                 && ansible-playbook -i inventories/infra.yml install-apache.yml \
								 && ansible-playbook -i inventories/infra.yml install-mariadb.yml
