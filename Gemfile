source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "rails", "~> 5.2"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootsnap", ">= 1.1.0", require: false
gem "webpacker", "~> 3.4"
gem "jquery-rails", "~> 4.3"
gem "clearance", "~> 1.16"
gem "cancancan", "~> 2.0"
gem "simple_form", "~> 4.0"
gem "figaro", "~> 1.1"
gem "sidekiq", "~> 5.1"
gem "kaminari", "~> 1.1"
gem "aws-sdk-s3", "~> 1.17", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", "~> 3.7"
  gem "rubocop"
  gem "pry"
  gem "pry-rails"
  gem "foreman"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "letter_opener"
end

group :test do
  gem "capybara", ">= 2.15", "< 4.0"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
  gem "shoulda-matchers", "~> 3.1"
  gem "rails-controller-testing"
  gem "factory_bot_rails"
  gem "faker"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
