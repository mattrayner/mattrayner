source 'https://rubygems.org'

gem 'rails', '4.2.0'

gem 'sqlite3'

gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.1.0'
gem 'turbolinks'
gem 'haml'
gem 'gravtastic'
gem 'kramdown'

gem 'devise'
gem 'carrierwave'
gem 'simple_form'

gem 'yard'

gem 'newrelic_rpm'

group :development do
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-passenger'

  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'codeclimate-test-reporter', require: nil
end

group :development, :test do
  gem 'byebug'

  gem 'web-console', '~> 2.0'

  gem 'spring'

  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, :git => "git://github.com/rspec/#{lib}.git", :branch => 'master'
  end

  gem 'factory_girl_rails', '~> 4.0'
  gem 'database_cleaner'

  gem 'pry'
end