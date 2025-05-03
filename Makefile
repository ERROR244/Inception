up:
	@sudo mkdir -p ./srcs/volumes/mariadb_data ./srcs/volumes/wordpress_data
	docker-compose -f ./srcs/docker-compose.yml up -d

stop:
	@sudo mkdir -p ./srcs/volumes/mariadb_data ./srcs/volumes/wordpress_data
	docker-compose -f ./srcs/docker-compose.yml stop

build:
	@sudo mkdir -p ./srcs/volumes/mariadb_data ./srcs/volumes/wordpress_data
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down -v

Down:
	@docker-compose -f ./srcs/docker-compose.yml down -v
	@sudo rm -rf ./srcs/volumes/mariadb_data/* ./srcs/volumes/wordpress_data/*

ps:
	@docker-compose -f ./srcs/docker-compose.yml ps

logs:
	@docker-compose -f ./srcs/docker-compose.yml logs

reUp: down
	@sudo mkdir -p ./srcs/volumes/mariadb_data ./srcs/volumes/wordpress_data
	@docker-compose -f ./srcs/docker-compose.yml up -d
	@clear

reBuild: down
	@sudo mkdir -p ./srcs/volumes/mariadb_data ./srcs/volumes/wordpress_data
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
	@clear

