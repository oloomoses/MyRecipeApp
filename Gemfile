source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 5.2.4', '>= 5.2.4.3'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'mini_magick', '~> 4.10', '>= 4.10.1'
gem 'carrierwave', '~> 2.1'

group :development, :test do
  gem 'sqlite3'
  gem 'pry'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring-watcher-listen', '~> 2.0.0'  
end

group :production do
  gem 'pg', '~> 1.2', '>= 1.2.3'
  gem 'rails_12factor'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
