
build:
	docker build -t biggora/gitlab-zone .

pull:
	docker pull biggora/gitlab-zone

publish:
	docker push biggora/gitlab-zone

commit:
	git push origin master
	git push mirror master

all: build pull publish commit

.PHONY: build pull
