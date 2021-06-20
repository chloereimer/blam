# blam

rails new command:

```bash
# cd to parent of project folder
PROJECT_NAME=blam
PROJECT_FOLDER=$(pwd)/$PROJECT_NAME
DOCKER_RUBY_IMAGE=ruby:3.0.1-alpine3.13
RAILS_NEW_COMMAND="rails new $PROJECT_NAME --api --database=postgresql"

docker run --rm --workdir /usr/src/$PROJECT_NAME --volume $(pwd):/usr/src/$PROJECT_NAME $DOCKER_RUBY_IMAGE sh -c "apk add --upgrade build-base postgresql-dev && printf \"source 'https://rubygems.org'\n\nruby '3.0.1'\ngem 'rails', '6.1.3.2'\n\" > Gemfile && bundle install && $RAILS_NEW_COMMAND"

cd $PROJECT_FOLDER
sudo chown -R $USER:$USER .
```