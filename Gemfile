source 'https://rubygems.org'

ruby '3.1.2'

gem 'rails', '7.0.4.1'

gem 'active_decorator'
gem 'bootsnap', require: false
gem 'kaminari'
gem 'pg', '~> 1.3'
gem 'puma'
gem 'uglifier', '>= 2.7.2'
gem 'jsbundling-rails'
gem 'cssbundling-rails'
gem 'sprockets-rails'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rack-mini-profiler'
  gem 'listen', require: false
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner-active_record'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'rspec_junit_formatter'
end
