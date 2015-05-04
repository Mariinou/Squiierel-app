#!/bin/bash
bundle install
bundle exec rake db:create
bundle exec rails server
