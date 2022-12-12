rubocop:
	docker-compose exec web bundle exec rubocop -a
tests:
	docker-compose exec web rails test
rubocop_fix:
	docker-compose exec web bundle exec rubocop -A
