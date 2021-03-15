source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.6"

gem "rails", "~> 6.1.0"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "webpacker", "~> 5.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"

# gem 'bcrypt', '~> 3.1.7' # Use Active Model has_secure_password

gem "simple_form"
gem "bootsnap", ">= 1.4.4", require: false
gem "haml-rails", "~> 2.0"
gem "nokogiri", "~> 1.11.0"
gem "rails-i18n"
gem "redcarpet"

gem "devise"

gem "will_paginate"
gem "will_paginate-bootstrap4"

gem "rollbar"
gem "newrelic_rpm"

gem "ruby-mp3info", require: false
gem "dalli"

gem "sitemap_generator" # https://github.com/kjvarga/sitemap_generator
gem "aws-sdk-s3" # hosting the sidemap on s3

gem "rack-attack"

group :development do
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "annotate"
  gem "spring"

  gem "haml_lint"
end

group :development, :test do
  gem "pry-nav"
  gem "pry-rails"

  gem "factory_bot_rails"
  gem "rspec-rails"
  # capybara
  gem "capybara"
  gem "launchy" # for capybara save_and_open_page
  gem "webdrivers"
  gem "standard"
  gem "dotenv-rails"
end

group :test do
  gem "simplecov", require: false
end
