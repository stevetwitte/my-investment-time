# My Investment Time

### Development
This app requires ruby 2.5.1 and Rails 5.2 as well as Postgres 9.6 and Redis.  

Setup the database and seed it with sample data with `rails db:setup sample:all`

Run the app locally with `foreman start`

### Testing
This app uses rspec, factory bot and faker for testing.

Run the test suite locally with `rspec`

### Deployment
Pushes to master automatically deploy to Heroku and production updates are done using pipelines.