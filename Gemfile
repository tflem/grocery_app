source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
ruby '2.6.5'
gem 'rails', '~> 5.2.4.5'
gem 'minitest-rails'
gem 'pg', '~> 1.1.4'
gem 'puma', '~> 4.3', '>= 4.3.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise', '~> 4.4', '>= 4.4.1'
gem 'pundit', '~> 1.1'
gem 'will_paginate-bootstrap4'
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'font-awesome-sass', '~> 5.8.1'

group :development, :test do
  gem 'simplecov', require: false
  gem 'byebug',  '9.0.6', platform: :mri
  gem 'rails-controller-testing', '1.0.2'
  gem 'minitest-reporters',       '1.1.14'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
  gem 'minitest-rails-capybara'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
