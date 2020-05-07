IMAGE=lewisohn/whoami
VERSION=0.1.6

build:
	docker build -t $(IMAGE):$(VERSION) .

push:
	docker push $(IMAGE):$(VERSION)
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest
	docker push $(IMAGE):latest

run:
	docker run -d -p 8000:5000 --rm --name "whoami" $(IMAGE):$(VERSION)

deploy:
	sed 's/_WHOAMI_VERSION_/$(VERSION)/g' stack.yaml | \
		docker stack deploy --compose-file - whoami

kube:
	kubectl create -f svc.yaml
	sed 's/_WHOAMI_VERSION_/$(VERSION)/g' dep.yaml | \
		kubectl create -f -

update: build deploy
