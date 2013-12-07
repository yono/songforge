source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.2'

gem 'thin'
gem 'twitter-bootstrap-rails'
gem 'kaminari'
gem 'less-rails'
gem 'pg'

group :development do
  gem 'foreman'
end

group :development, :test do
  gem 'pry-rails'
end

group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'simplecov', :require => false
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
