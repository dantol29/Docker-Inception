all: $(NAME)

$(NAME) :
	docker-compose -f srcs/docker-compose.yml up

up:
	docker-compose -f srcs/docker-compose.yml up --build

stop:
	docker stop $(docker ps -q)

clean: stop
	docker rm $(docker ps -aq)

re: stop clean all

.PHONY: all up stop clean re
