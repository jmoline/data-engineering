# Setting up the Data Import application

## Things you may want to know:

* Ruby version

This application was written in Rails 4.1.1 running on Ruby 2.1.1

* System dependencies

Bundler 1.6.1 or greater

* Database creation

The application uses sqlite3, so I think the db creation is covered, but just in case, you can run:

bundle exec rake:db:create

* Database initialization

bundle exec rake:db:migrate

* How to run the test suite

bundle exec rake test:all:db

* Deployment instructions

1. Clone the repository locally
1. cd into the app directory
1. run 'bundle install'
1. run 'bundle exec rake db:migrate'
1. run 'rails server'
1. Open a browser and go to 'http://localhost:3000'
