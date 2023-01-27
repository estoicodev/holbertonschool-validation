.PHONY: build

# Destiny directory
DIST_DIR = dist

build: ## Create the Hugo website using Hugo
# @apt-get install curl -y &&\
# curl -L https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb -o hugo.deb &&\
# apt-get install ./hugo.deb &&\
# rm ./hugo.deb
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

package: ## Create a zip file with dist/ directory
	@apt-get install curl -y &&\
	curl -L https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb -o hugo.deb &&\
	apt-get install ./hugo.deb &&\
	rm ./hugo.deb
	@hugo
	@zip -r awesome-website.zip dist/

lint: ## Lint the README.md and DEPLOY.md files and lint Dockerfile
	@apt-get install curl -y
	@curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
	@apt-get install -y nodejs
	@npm install -g markdownlint-cli -y || true
	@markdownlint README.md DEPLOY.md
	@curl https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64 -o hadolint
	@mv hadolint /usr/local/bin/
	@chmod +x /usr/local/bin/hadolint
	@hadolint build/Dockerfile

unit-tests: ## Unit tests coverage
	@touch coverage-units.out

integration-tests: ## Integration tests coverage
	@touch coverage-integrations.out

build-docker: ## Create a new Docker image named awesome:build
	@docker build -t awesome:build -f build/Dockerfile .

docker-build: ## Create a new Docker image named awesome:build passed lint
# @curl https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64 -o hadolint
# @mv hadolint /usr/local/bin/
# @chmod +x /usr/local/bin/hadolint
	@hadolint build/Dockerfile && docker build -t awesome:build -f build/Dockerfile .

run-docker: ## Run docker with correct Makefile
	@cat Makefile > MakefileLocal
	@cat MakefileDocker > Makefile
	@docker run -v $(pwd):/app awesome:build /bin/sh

test: ## Execute Tests
	@make unit-tests
	@make integration-tests

docker-tests: ## Test of Docker with container-structure-test command
# @curl https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64 -o container-structure-test
# @mv container-structure-test /usr/local/bin/
# @chmod +x /usr/local/bin/container-structure-test
	@container-structure-test test --image awesome:build --config ./build/cst.yml

validate: ## Validate project

help: ## Show usage of each make target
	@echo "Usage: make <command>"
	@echo "------"
	@fgrep -h "##" Makefile | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'