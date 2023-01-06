## Awesome Inc.

### Prerequesites

- Go Hugo v0.80+
- Git version 2+
- GNU Make version 3.81+
- The website is expected to be generated into ./dist folder when you run `make build`

### Lifecycle

- post: Create a new post in Markdown to content/posts using POST_NAME and POST_TITLE environment variables for filename and title respectively

Usage:

```

$ make post

```

- build: Create the Hugo website using Hugo

Usage:

```

$ make build

```

- clear: Remove the directory of the result code of Hugo website

Usage:

```

$ make clear

```

- help: Show more details of each rule

Usage:

```

$ make help

```
