# GO_PIPELINE_COUNTER is the pipeline number, passed from GoCD.
# If we're running this from the command line, use a default value.
GO_PIPELINE_COUNTER?="unknown"

export IMAGE_VERSION=0.1.$(GO_PIPELINE_COUNTER)

export IMAGE_NAME=ukpds/search-for-member:$(IMAGE_VERSION)

build :
	docker-compose build

test :
	docker-compose run web rake spec
	docker-compose down

deploy-systest:
	docker pull redis:3.0.7
	# docker-compose -f docker-compose.systest.yml pull
	# docker-compose -f docker-compose.systest.yml up -d

push:
	docker build -t $(IMAGE_NAME) .
	docker push $(IMAGE_NAME)
	docker rmi $(IMAGE_NAME)