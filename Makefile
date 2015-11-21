
build:
	docker build -t biggora/gitlab-zone .

pull:
	docker pull biggora/gitlab-zone

publish:
	docker push biggora/gitlab-zone

commit:
	git push origin master
	git push mirror master

help:
	@echo "## help"
	@echo "  make build                # Create docker image"
	@echo "  make publish              # Publish image to Docker HUB"
	@echo "  make pull                 # Publish image to local storage"
	@echo "  make commit               # Push sources to repositories"
	@echo "  make all                  # All actions step by step"

all: build pull publish commit

.PHONY: build pull
