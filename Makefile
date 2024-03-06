run:
	docker compose up --build

watch:
	docker compose watch --no-up

dev:
	make -j2 watch run