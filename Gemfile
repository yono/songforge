source 'https://rubygems.org'

ruby '2.1.1'

gem 'rails', '4.0.4'

gem 'passenger'
gem 'twitter-bootstrap-rails'
gem 'kaminari'
gem 'less-rails'
gem 'pg'
gem 'spring'
gem 'active_decorator'

group :development do
  gem 'foreman'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'rack-mini-profiler'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'pry-rails'
  gem 'marco-polo'
  gem 'rspec-rails'
  gem 'fuubar'
end

group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'simplecov', :require => false
  gem 'coveralls', require: false
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'less'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
