rmi: stop-test
	docker rmi absoluteminimum/sinopia 2>&1 > /dev/null

build:
	docker build -t absoluteminimum/sinopia:latest .

start-test: stop-test build
	docker run -p 4873:4873 --name sinopia-test -v /home/docker/sinopia-test:/opt/sinopia/storage absoluteminimum/sinopia:latest
	docker logs sinopia-test

stop-test:
	-docker rm -f sinopia-test 2>&1 > /dev/null

test: build
	docker run --rm -i -t absoluteminimum/sinopia:latest

shell: build
	docker run --rm -i -t absoluteminimum/sinopia:latest /bin/bash

logs:
	docker logs sinopia-test

publish:
	docker push absoluteminimum/sinopia:latest

test: start-test
