source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.3'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'redis', '~> 3.0'
gem 'sidekiq'
gem 'kaminari'
gem 'clearance'
gem 'pundit'
gem 'sass', '~> 3'
gem 'telegram-bot-ruby', '~> 0.8'
gem 'whenever', '~> 0.9.7'
gem 'twitter', '~> 6.1.0'

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'datetime_picker_rails'
gem 'momentjs-rails'
gem 'normalize-rails'
gem 'font-awesome-rails'
gem 'bulma-rails', '~> 0.6'

gem 'bugsnag'
gem 'newrelic_rpm'

group :development, :test do
  gem 'pry'
  gem 'rspec'
  gem 'rspec-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development do
  gem 'capistrano', '3.9.0', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-upload-config'
  gem 'activerecord_sane_schema_dumper'
  gem 'capistrano-template', require: false
end
