# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

  - Ruby 2.7.0
  - Rails 6.0.3.3

* Database Configuration
  - install postgresql

  Copy the sample database.yml file and edit the database configuration as required.

  - cp config/database.yml.sample config/database.yml

* Database creation
  - rake db:create
  - rake db:migrate

* Start the Rails server
  You can start the rails server using the command given below.
  - rails server

  And now you can visit the site with the URL http://localhost:3000

* Deployment instructions
  - These below files don't need to push in the branch.
   - config/database.yml
   - db/schema.rb
   - Gemfile.lock

* ...
