source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Devise is a flexible authentication solution for Rails based on Warden.
gem 'devise'
# Is a devise extension which uses JWT tokens for user authentication.
gem 'devise-jwt', '~> 0.7.0'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS),
# making cross-origin AJAX possible
# gem 'rack-cors'
# Roles library without any authorization enforcement supporting scope on
# resource object.
gem 'rolify'
# CanCan is an authorization library for Ruby on Rails which restricts what
# resources a given user is allowed to access
gem 'cancancan'

group :development, :test do
  #  Brings the RSpec testing framework to Ruby on Rails as a drop-in
  # alternative to its default testing framework, Minitest.
  gem 'rspec-rails', '~> 4.0.2'
  # factory_bot_rails provides Rails integration for factory_bot.
  gem 'factory_bot_rails'
  # A library for generating fake data.
  gem 'faker'
  # SimpleCov is a code coverage analysis tool for Ruby.
  gem 'simplecov', require: false, group: :test
end

group :development do
  # Add a comment summarizing the current schema to the top or bottom
  gem 'annotate'
  # Great Ruby dubugging companion: pretty print Ruby objects to visualize their
  # structure. Supports custom object formatting via plugins
  gem 'awesome_print', require: 'ap'
  # Brakeman is a static analysis tool which checks Ruby on Rails applications
  # for security vulnerabilities.
  gem 'brakeman'
  # Autoload dotenv in Rails.
  gem 'dotenv-rails', groups: %i[development test]
  # Automatically checks Ruby code style with RuboCop when files are modified.
  gem 'guard-rubocop'
  # When mail is sent from your application, Letter Opener will open a preview
  # in the browser instead of sending.
  gem "letter_opener", :group => :development
  # Listens to file modifications and notifies you about the changes.
  gem 'listen', '~> 3.3'
  # Use Pry as your rails console
  gem 'pry-rails', group: :development
  # A RuboCop extension focused on enforcing Rails best practices and coding
  # conventions.
  gem 'rubocop-rails', require: false
  # RSpec-specific analysis for your projects, as an extension to RuboCop.
  gem 'rubocop-rspec', require: false
  # Making tests easy on the fingers and eyes
  gem 'shoulda-matchers'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Access an interactive console on exception pages or by calling 'console'
  # anywhere in the code.
  gem 'web-console', '>= 4.1.0'
end
