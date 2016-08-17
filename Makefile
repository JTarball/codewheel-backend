# Makefile
# 

all: run

stop:
	docker stop $(docker ps -q)

run:
	bash -c 'docker-compose run --service-ports app'