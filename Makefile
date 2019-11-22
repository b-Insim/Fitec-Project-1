all:

pull:
	git pull origin master || :
	
ansible:
	cd src/ansible && ansible-playbook -i inventories/infra.yml install.yml \
                 && ansible-playbook -i inventories/infra.yml install-apache.yml \
								 && ansible-playbook -i inventories/infra.yml install-mariadb.yml
