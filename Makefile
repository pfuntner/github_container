all: build start

build:
	docker build -f Dockerfile -t git-server .

start:
#	docker run --name data git-server /bin/true
#	docker cp yaml_rule_check.py data:/home/git/test.git/hooks/pre-receive
#	docker run -d -p 52311:22 --volumes-from data pre-receive.dev
	docker run -d -p 52311:22 --name github git-server
	docker cp github:/home/git/.ssh/id_rsa github_id_rsa
	chmod 600 github_id_rsa
	docker exec github bash -c "echo `cat ~/.ssh/id_rsa.pub` >> /home/git/.ssh/authorized_keys"
	# ./copy_hook.sh
# 	@echo "id_rsa: ${PWD}/id_rsa"
# 	@echo 'Try:'
# 	@echo 'GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p 52311 -i id_rsa" git push -u test master'

clean: clean-containers clean-images

clean-containers:
	-docker rm -f github

clean-images:
	-docker rmi -f git-server
