.PHONY: build

# Destiny directory
DIST_DIR = dist

build: ## Create the Hugo website using Hugo
	@apt-get install curl -y
	@curl -L https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb -o hugo.deb
	@apt-get install ./hugo.deb
	@rm ./hugo.deb
	@hugo
	@touch awesome-api

clean: ## Remove the directory of the result code of Hugo website
	@rm -rf $(DIST_DIR)
# @find $(DIST_DIR) ! -name 'awesome-website.zip' -type d -exec rm -rf {} +

NEW_LINE = title: \"$(POST_TITLE)\"
post: ## Create a new post in Markdown to content/posts using POST_NAME and POST_TITLE environment variables for filename and title respectively
	@rm -rf content/posts/$(POST_NAME).md
	@hugo new posts/$(POST_NAME).md
	@sed -i '1,2d' content/posts/$(POST_NAME).md
	@sed -i '1i ---' content/posts/$(POST_NAME).md
	@sed -i '2i $(NEW_LINE)' content/posts/$(POST_NAME).md

package: ## Create a zip file with dist/ directory
	@hugo
	@zip -r awesome-website.zip dist/

lint: ## Lint the files README.md and DEPLOY.md with markdownlint command line
	@apt-get install curl -y
	@curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
	@apt-get install -y nodejs
	@npm install -g markdownlint-cli -y || true
	@markdownlint README.md
	@markdownlint DEPLOY.md

unit-tests: ## Unit tests coverage
	@touch coverage-units.out

integration-tests: ## Integration tests coverage
	@touch coverage-integrations.out

build-docker: ## Create a new Docker image named awesome:build
	@docker build -t awesome:build -f build/Dockerfile .

test: ## Execute Tests
	@make unit-tests
	@make integration-tests

validate: ## Validate project

help: ## Show usage of each make target
	@echo "Usage: make <command>"
	@echo "------"
	@cat Makefile | grep "^\w*:.*##.*" | sed 's/## //'
