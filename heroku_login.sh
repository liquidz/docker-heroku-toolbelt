#!/bin/sh

heroku login
heroku keys:remove heroku@docker.local
heroku keys:add ~/.ssh/heroku_rsa_key.pub

