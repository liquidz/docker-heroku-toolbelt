# Dockerfile for Heroku toolbelt

## Usage
 * Build your image
```
echo "FROM uochan/heroku-toolbelt" > Dockerfile
docker build --rm -t FIXME/heroku-toolbelt .
```
 * Login to heroku
```
docker run -it FIXME/heroku-toolbelt /bin/bash
sh /heroku_login.sh
heroku apps
```
