all:

ansible:
	git pull origin master
	cd src/ansible && ansible-playbook -i inventories/infra.yml install.yml
