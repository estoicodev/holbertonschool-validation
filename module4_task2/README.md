# Awesome Inc

## Prerequisites

- Go Hugo v0.80+
- Git version 2+
- GNU Make version 3.81+
- The website is expected to be generated into ./dist folder when you run `make build`

## Lifecycle

<!-- language-all: lang-shell -->

- lint: Lint Markdown files and Dockerfile.

  Usage:

  ```shell

  make lint

  ```

- post: Create a new post in Markdown to content/posts
  using `POST_NAME` and `POST_TITLE` environment variables
  for filename and title respectively.

  Usage:

  ```shell

  make post

  ```

- build: Create the Hugo website using Hugo.

  Usage:

  ```shell

  make build

  ```

- clean: Remove the directory of the result code of Hugo website.

  Usage:

  ```shell

  make clean

  ```

- help: Show more details of each rule.

  Usage:

  ```shell

  make help

  ```

- package: Create zip file with hugo application.

  Usage:

  ```shell

  make package

  ```

- unit-tests: Creates coverage units file

  Usage:

  ```shell

  make unit-tests

  ```

- integration-tests: Creates integration coverage file

  Usage:

  ```shell

  make integration-tests

  ```

- build-docker: Creates a docker container with all the tools

  Usage:

  ```shell

  make build-docker

  ```

- docker-build: Creates a docker container with all the tools and passed lint

  Usage:

  ```shell

  make docker-build

  ```

- docker-tests: Test docker container

  Usage:

  ```shell

  make docker-tests

  ```

## Workflows

- `module3_task0.yml`: Check Makefile is present and implement a help target.
- `module3_task1.yml`: Check All Makefile targets are present and works.
- `module3_task2.yml`: Create zip file with Hugo application every push in main.
- `module3_task3.yml`: Add git tag trigger that uploads zip file and DEPLOY.md
  in a Github release with a tag `1.0.0`.
- `module3_task4.yml`: Create a release-drafter to automate each new Github release.
- `module3_task5.yml`: Automate Netlify deployment.

  Implement Docker:

- `module4_task0.yml`
- `module4_task1.yml`
- `module4_task2.yml`
