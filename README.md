# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* Setting up environment variables
  1. Create a **.env** file in the root of the project
  2. Open **.env** and set the following variables:
      ```
      SECRET_KEY_BASE= 'your_secrete_key_base_here'
      POSTGRESQL_USERNAME= 'your_postgresql_username'
      POSTGRESQL_PASSWORD= 'your_postgresql_password'
      ``` 

* How to run the test suite

  To run all of the tests:
  ```
  rails test
  ```
  To run the auth controller test
  ```
  rails test test/controllers/api/auth_controller_test.rb
  ```
  To run the notes controller test
  ```
  rails test test/controllers/api/notes_controller_test.rb
  ```
  To run the search notes controller test
  ```
  rails test test/controllers/api/search_notes_controller_test.rb
  ```
  To run the share notes controller test
  ```
  rails test test/controllers/api/share_notes_controller_test.rb
  ```
* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
