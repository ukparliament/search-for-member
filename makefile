# GO_PIPELINE_COUNTER is the pipeline number, passed from our build agent.
GO_PIPELINE_COUNTER?="unknown"

# DOCKER_SWARM_URL is passed from our build agent.
DOCKER_SWARM_URL?="unknown"
export DOCKER_HOST=$(DOCKER_SWARM_URL) 

export IMAGE_VERSION=0.1.$(GO_PIPELINE_COUNTER)
export IMAGE_NAME=ukpds/search-for-member:$(IMAGE_VERSION)

build :
	docker-compose build

test :
	docker-compose run web rake spec
	docker-compose down

push:
	docker build -t $(IMAGE_NAME) .
	docker push $(IMAGE_NAME)
	docker rmi $(IMAGE_NAME)

deploy-systest:
	docker-compose -f docker-compose.systest.yml up -d