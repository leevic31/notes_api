# README

* Technology Choices
  
  Framework: Ruby on Rails
  - this is the framework I was most comfortable with and allowed me to be the most productive

  DB: Postgresql
  - postgresql supports text-indexing, while other options like sqllite did not
  - postgresql is required for the project to be hosted on Render

  3rd party tools
  - used the gem jwt for authentication and authorization
  - used the gem bcrypt for password-hashing
  - used the gem pg_search for text-indexing for the search method
  - used the gem rack-attack for rate-limiting and request throttling

* Ruby version
  3.0.2

* Install dependencies
  ```
    bundle install
  ```

* Database creation
  ```
  rails db:create
  ```

* Database initialization
  ```
  rails db:migrate
  ```

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
  
* Start the server
  ```
    rails server
  ```

* API documentation
  https://documenter.getpostman.com/view/37003772/2sA3kRJPJw

* Deployment Link
  https://notes-api-j7t4.onrender.com

  Note: this API has been deployed on Render but the link does not display anything