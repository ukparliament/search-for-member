# GO_PIPELINE_COUNTER is the pipeline number, passed from GoCD.
# If we're running this from the command line, use a default value.
GO_PIPELINE_COUNTER?="unknown"

IMAGE_NAME=ukpds/search-for-member:$(GO_PIPELINE_COUNTER)

build :
	docker-compose build

test :
	docker-compose run web rake spec

push:
	docker build -t $(IMAGE_NAME) .
	docker push $(IMAGE_NAME)
	docker rmi $(IMAGE_NAME)