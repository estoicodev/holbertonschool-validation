# Makefile Local
.PHONY: build

# Destiny directory
DIST_DIR = dist

build: ## Create the Hugo website using Hugo
	@hugo
	@touch awesome-api

clean: ## Remove the directory of the result code of Hugo website
	@rm -rf $(DIST_DIR)

NEW_LINE = title: \"$(POST_TITLE)\"
post: ## Create a new post in Markdown to content/posts using POST_NAME and POST_TITLE environment variables for filename and title respectively
	@rm -rf content/posts/$(POST_NAME).md
	@hugo new posts/$(POST_NAME).md
	@sed -i '1,2d' content/posts/$(POST_NAME).md
	@sed -i '1i ---' content/posts/$(POST_NAME).md
	@sed -i '2i $(NEW_LINE)' content/posts/$(POST_NAME).md

docker-tests: ## Test of Docker with container-structure-test command
	@container-structure-test test --image awesome:build --config ./build/cst.yml
	@container-structure-test test --image awesome:main --config ./cst.yml

GIT_TAG=$(shell git describe --exact-match --tags HEAD)
ifndef GIT_TAG
GIT_TAG=$(shell git rev-parse --abbrev-ref HEAD)
endif
package: build ## Package hugo app in .zip file with Docker
	@test -d dist/ && test -f dist/index.html && echo TEST_OK
	@docker build -t awesome:$(GIT_TAG) -f ./Dockerfile .
	@docker save awesome:$(GIT_TAG) -o docker.tar && zip -r docker.zip docker.tar &&\
	rm docker.tar

test-dist: ## For test dist/ in image
	@test -f ./dist/index.html

lint: ## Lint the README.md and DEPLOY.md files and lint Dockerfile
	@markdownlint README.md DEPLOY.md
	@hadolint build/Dockerfile && hadolint ./Dockerfile

unit-tests: ## Unit tests coverage
	@touch coverage-units.out

integration-tests: ## Integration tests coverage
	@touch coverage-integrations.out

build-docker: ## Create a new Docker image named awesome:build
	@docker build -t awesome:build -f build/Dockerfile .

docker-build: ## Create a new Docker image named awesome:build passed lint
	@hadolint build/Dockerfile && docker build -t awesome:build -f build/Dockerfile .

makefile-docker: ## Prepare correct Makefile for Docker
	@cat Makefile > MakefileLocal
	@cat MakefileDocker > Makefile

makefile-local: ## Prepare correct Makefile for local
	@cat Makefile > MakefileDocker
	@cat MakefileLocal > Makefile

run-docker-build: ## Run docker build
	docker run -it --name alpine-go -v $(pwd):/app awesome:build /bin/sh

run-docker-app: ## Run docker build
	docker run -it --name hugo-app awesome:$(GIT_TAG)

validate: ## Validate project

help: ## Show usage of each make target
	@echo "Usage: make <command>"
	@echo "------"
	@fgrep -h "##" Makefile | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'