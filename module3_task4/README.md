# Awesome Inc

## Prerequisites

- Go Hugo v0.80+
- Git version 2+
- GNU Make version 3.81+
- The website is expected to be generated into ./dist folder when you run `make build`

## Lifecycle

<!-- language-all: lang-shell -->

- post: Create a new post in Markdown to content/posts
  using `POST_NAME` and `POST_TITLE` environment variables
  for filename and title respectively.

  Usage:

  ```shell

  make post

  ```

- build: Create the Hugo website using Hugo

  Usage:

  ```shell

  make build

  ```

- clean: Remove the directory of the result code of Hugo website

  Usage:

  ```shell

  make clean

  ```

- help: Show more details of each rule

  Usage:

  ```shell

  make help

  ```

- package: Create zip file with hugo application

  Usage:

  ```shell

  make package

  ```

## Workflow

- `module3_task0`: Check Makefile is present and implement a help target.
- `module3_task1`: Check All Makefile targets are present and works.
- `module3_task2`: Create zip file with Hugo application every push in main.
- `module3_task3`: Add git tag trigger that uploads zip file and DEPLOY.md
  in a Github release with a tag `1.0.0`.
- `module3_task4`: Create a release-drafter to automate each Github release.
