source 'https://rubygems.org'

ruby '2.4.1'

gem 'rails', '5.1.4'

# application server
gem 'puma'

# pagination
gem 'kaminari'

# database adapter
gem 'pg'

# rails preloader
gem 'spring'

gem 'bootstrap-sass', '~> 3.3.6'

# object-oriented view helper
gem 'active_decorator'

# jQuery with rails
gem 'jquery-rails', '>= 4.0.4'

# css pre-processor with rails
gem 'sass-rails',   '~> 5.0.0'

# javascript pre-processor
gem 'coffee-rails'

# css pre-processor
gem 'less'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# JavaScript compressor
gem 'uglifier', '>= 2.7.2'

# management environment variables by .env
gem 'dotenv-rails'

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

  # extend console prompt
  gem 'marco-polo'

  # BDD library with rails
  gem 'rspec-rails'

  # for controller test
  gem 'rails-controller-testing'

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
  # for rspec with capybara
  gem 'database_cleaner'
  # for capybara debug
  gem 'launchy'
  # javascript driver on test
  gem 'poltergeist'
end
gem 'nokogiri', '>= 1.8.2'
gem 'loofah', '>= 2.2.1'
gem 'rails-html-sanitizer', '>= 1.0.4'
