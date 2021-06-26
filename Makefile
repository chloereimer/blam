lint:
	docker compose run api bundle exec standardrb --fix

lint-dry-run:
	docker compose run api bundle exec standardrb

db-migrate:
	docker compose run api bundle exec rails db:migrate

db-rollback:
	docker compose run api bundle exec rails db:rollback

bundle-lock:
	docker compose run api bundle lock
