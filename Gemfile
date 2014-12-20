source 'https://rubygems.org'

ruby '2.1.5'

gem 'rails', '4.2.0'

# application server
gem 'passenger'

# css framework
gem 'twitter-bootstrap-rails'

# pagination
gem 'kaminari'

# css pre-processor with rails
gem 'less-rails'

# database adapter
gem 'pg'

# rails preloader
gem 'spring'

# object-oriented view helper
gem 'active_decorator'

# jQuery with rails
gem 'jquery-rails'

# css pre-processor with rails
gem 'sass-rails',   '~> 5.0.0'

# javascript pre-processor
gem 'coffee-rails', '~> 4.1.0'

# css pre-processor
gem 'less'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# JavaScript compressor
gem 'uglifier', '>= 1.3.0'

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

  # mute assets pipeline log
  gem 'quiet_assets'

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
  gem 'rspec-rails', '~> 3.1.0'

  # rspec command for spring
  gem 'spring-commands-rspec'

  # automatically run specs when files are modified
  gem 'guard-rspec'

  # fixture replacement
  gem 'factory_girl_rails'

  # static metrics tools
  gem 'code_hunter'
  gem 'rubocop', require: false
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

