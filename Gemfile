source 'https://rubygems.org'

ruby '3.3.11'

gem 'rails', '~> 7.2.0'
gem 'pg', '~> 1.5'
gem 'puma', '~> 7.2'
gem 'bcrypt', '~> 3.1.7'
gem 'rack-cors'
gem 'jwt'
gem 'bootsnap', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri windows]
  gem 'rspec-rails', '~> 7.0'
  gem 'rubocop', require: false
  gem 'bundler-audit', require: false
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers', '~> 6.0'
end

gem 'tzinfo-data', platforms: %i[windows jruby]
