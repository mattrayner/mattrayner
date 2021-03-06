source 'https://rubygems.org'

gem 'rails', '4.2.0'

gem 'mysql2'

gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.1.0'
gem 'turbolinks'
gem 'haml'
gem 'gravtastic'
gem 'kramdown'
gem 'mini_magick'

gem 'fitgem'
gem 'rufus-scheduler'

gem 'devise'
gem 'carrierwave'
gem 'simple_form'

gem 'newrelic_rpm'

group :development do
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-passenger', '0.0.2'

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

  %w(core expectations mocks rails support).each do |lib|
    gem "rspec-#{lib}",
        git: "git://github.com/rspec/rspec-#{lib}.git",
        branch: 'master'
  end

  gem 'factory_girl_rails', '~> 4.0'
  gem 'database_cleaner'
  gem 'pry'
  gem 'yard'

  gem 'rubocop'
  gem 'inch'

  gem 'dotenv-rails'
end
