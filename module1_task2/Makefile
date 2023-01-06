# Destiny directory
DIST_DIR = dist

build: ## Create the Hugo website using Hugo
	@mkdir -p $(DIST_DIR)
	@hugo

clean: ## Remove the directory of the result code of Hugo website
	@rm -rf $(DIST_DIR)

NEW_LINE = title: \"$(POST_TITLE)\"
post: ## Create a new post in content/posts using POST_NAME and POST_TITLE environment variables
	hugo new posts/$(POST_NAME).md
	@sed -i '1,2d' content/posts/$(POST_NAME).md
	@sed -i '1i ---' content/posts/$(POST_NAME).md
	@sed -i '2i $(NEW_LINE)' content/posts/$(POST_NAME).md

help: ## Help option to more details of each rule
	@echo "build: Create the Hugo website using Hugo"
	@echo "clean: Remove the directory of the result code of Hugo website"
	@echo "post: Create a new post in Markdown to content/posts using POST_NAME and POST_TITLE environment variables for filename and title respectively"
	@echo "help: Show this help usage"
