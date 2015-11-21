
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
	@echo "## WORKFLOW"
	@echo "  make build                # Create docker image"
	@echo "  make publish              # Push image to Docker HUB"
	@echo "  make pull                 # Pull image to local storage"
	@echo "  make commit               # Push changes to repositories"
	@echo "  make all                  # All actions step by step"

all: build pull publish commit

.PHONY: build pull
