up:
	@sudo mkdir -p /home/ksohail-/data/mariadb_data /home/ksohail-/data/wordpress_data
	docker-compose -f ./srcs/docker-compose.yml up -d

stop:
	@sudo mkdir -p /home/ksohail-/data/mariadb_data /home/ksohail-/data/wordpress_data
	docker-compose -f ./srcs/docker-compose.yml stop

build:
	@sudo mkdir -p /home/ksohail-/data/mariadb_data /home/ksohail-/data/wordpress_data
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	@docker-compose -f ./srcs/docker-compose.yml down -v

Down:
	@sudo rm -rf /home/ksohail-/data/mariadb_data/* /home/ksohail-/data/wordpress_data/*
	@docker-compose -f ./srcs/docker-compose.yml down -v

ps:
	@docker-compose -f ./srcs/docker-compose.yml ps

logs:
	@docker-compose -f ./srcs/docker-compose.yml logs

reUp: down
	@sudo mkdir -p /home/ksohail-/data/mariadb_data /home/ksohail-/data/wordpress_data
	@docker-compose -f ./srcs/docker-compose.yml up -d
	@clear

reBuild: down
	@sudo mkdir -p /home/ksohail-/data/mariadb_data /home/ksohail-/data/wordpress_data
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
	@clear

