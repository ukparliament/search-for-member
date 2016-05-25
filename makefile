build :
	docker-compose build

test :
	docker-compose run web rake spec
