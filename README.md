# README

Using Ruby 2.6.3 and Rails Rails 6.0.2.1 
Standard Rails scaffolding with rails new


## Setup

If you have rvm installed, changing into this directory should automatically set your
ruby version and gemset.

* rails db:migrate
* bundle install
* rails s

Create two users by visiting 

http://localhost:3000/users/sign_up

Log into each user in separate browsers or user profiles.

Send messages back and forth.

## Technology

* Uses SQLite for simplicity
* Uses devise for users
* A bit of modern CSS for styling
* Showing user's own messsages uses built-in Rails UJS
* Use jbuilder to format JSON responses
* Update from other users uses FETCH api
* Does not use turbolinks or spring

## TODO

* Bug fix: Put polling function inside check for "is user logged in", currently spams logs with attempts with old tokens if the server is started with users logged out