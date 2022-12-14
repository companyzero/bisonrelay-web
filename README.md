# bisonrelay-web

## Overview

This is the code for the [bisonrelay.org](https://bisonrelay.org) website.
It is built using the static site generator [Hugo](https://gohugo.io/) and
utilizes [Docker](https://www.docker.com/) for testing and deployment.

## Development

To start a development web server at <http://localhost:1313>:

```sh
./bin/watch.sh
```

Run the HTML validator to ensure all of the generated files are syntactically
correct:

```sh
./bin/test.sh
```

## Deployment with Docker

```sh
# Build the companyzero/bisonrelay-web image.
./bin/build.sh

# Start the container.
docker run -d -p <local port>:80 companyzero/bisonrelay-web:latest
```

## License

bisonrelay-web is licensed under the liberal ISC License.
