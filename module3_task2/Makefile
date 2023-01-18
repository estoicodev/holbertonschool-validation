# Destiny directory
DIST_DIR = dist

build: ## Create the Hugo website using Hugo
	@hugo

clean: ## Remove the directory of the result code of Hugo website
	@rm -rf $(DIST_DIR)
# @find $(DIST_DIR) ! -name 'awesome-website.zip' -type d -exec rm -rf {} +

NEW_LINE = title: \"$(POST_TITLE)\"
post: ## Create a new post in Markdown to content/posts using POST_NAME and POST_TITLE environment variables for filename and title respectively
	@hugo new posts/$(POST_NAME).md
	@sed -i '1,2d' content/posts/$(POST_NAME).md
	@sed -i '1i ---' content/posts/$(POST_NAME).md
	@sed -i '2i $(NEW_LINE)' content/posts/$(POST_NAME).md

help: ## Show help option to more details of each rule
	@cat Makefile | grep "^\w*:.*##.*" | sed 's/## //'

package: ## Create a zip file with dist/ directory
	@make build
	@zip -r awesome-website.zip dist/

lint: ## Lint the files README.md and DEPLOY.md with markdownlint command line
	@markdownlint README.md
	@markdownlint DEPLOY.md

validate: ## check current directory
	@pwd

integration-tests: ## Integration tests
	@hugo
	ls dist/

unit-tests: ## Unit tests for make targets
	@make help
	@make lint
	@make POST_TITLE='IS A TEST' POST_NAME='is-a-test' post
	@make build
	@make clean
