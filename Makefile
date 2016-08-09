all: push

TAG = 1.0
PREFIX = docker.io/foxish/mongodb

build:
	@docker build -t $(PREFIX):$(TAG) .

push: build
	docker push $(PREFIX):$(TAG)

clean:
	docker rmi $(PREFIX):$(TAG)