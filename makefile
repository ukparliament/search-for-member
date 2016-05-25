GO_STAGE_COUNTER?="unknown"
IMAGE_NAME=ukpds/search-for-member:$(GO_STAGE_COUNTER)

build :
	docker-compose build

test :
	docker-compose run web rake spec

push:
	docker build -t $(IMAGE_NAME) .
	docker push $(IMAGE_NAME)
	docker rmi $(IMAGE_NAME)