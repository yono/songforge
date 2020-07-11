source 'https://rubygems.org'

ruby '2.6.2'

gem 'rails', '6.0.3.2'

# application server
gem 'puma'

# pagination
gem 'kaminari'

# database adapter
gem 'pg', '~> 0.21'

# rails preloader
gem 'spring'

gem 'bootstrap', '>= 4.3.1'
gem 'font-awesome-rails'

# object-oriented view helper
gem 'active_decorator'

# jQuery with rails
gem 'jquery-rails', '>= 4.0.4'

# css pre-processor with rails
gem 'sass-rails',   '>= 6'

# JavaScript compressor
gem 'uglifier', '>= 2.7.2'

# management environment variables by .env
gem 'dotenv-rails'

gem 'bootsnap', require: false

gem 'rack-user_agent'

gem 'webpacker'

gem 'jbuilder'

group :development do
  # application process manager
  gem 'foreman'

  # extend console like irb or pry
  gem 'hirb'
  # hirb with unicode
  gem 'hirb-unicode'

  # profiler for rack application
  gem 'rack-mini-profiler'

  # replace standard rails error page to more useful
  gem 'better_errors'
  # provide console to better_errors
  gem 'binding_of_caller'

  # pretty print
  gem 'awesome_print'

  # manage i18n tlanslations
  gem 'i18n-tasks'
end

group :development, :test do
  # irb alternative consosle with rails
  gem 'pry-rails'
  gem 'pry-byebug'

  # extend console prompt
  gem 'marco-polo'

  # BDD library with rails
  gem 'rspec-rails'

  # rspec command for spring
  gem 'spring-commands-rspec'

  # automatically run specs when files are modified
  gem 'guard-rspec'

  # fixture replacement
  gem 'factory_bot_rails'
end

group :production do
  # for heroku
  gem 'rails_12factor'
end

group :test do
  # code coverage analysis tool
  gem 'simplecov', require: false
  # for coveralls.io
  gem 'coveralls', require: false

  # acceptance test framework for web applications
  gem 'capybara'
  # for capybara debug
  gem 'launchy'
  # javascript driver on test
  gem 'selenium-webdriver'
end
gem 'nokogiri', '>= 1.8.2'
