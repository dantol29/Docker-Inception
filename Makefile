all:
	docker-compose -f srcs/docker-compose.yml up

up:
	docker-compose -f srcs/docker-compose.yml up --build

stop:
	docker-compose -f srcs/docker-compose.yml down

clean: stop
	# delete all containers, images
	docker-compose -f srcs/docker-compose.yml rm -f
	docker-compose -f srcs/docker-compose.yml down --rmi all

re: stop clean all

.PHONY: all up stop clean re
