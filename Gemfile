# Copyright 2011-2014 Rice University. Licensed under the Affero General Public 
# License version 3 or later.  See the COPYRIGHT file for details.

source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# Bootstrap
gem 'bootstrap-sass', '~> 3.2.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# jquery UI library
gem 'jquery-ui-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Automatically add browser-specific CSS prefixes
gem 'autoprefixer-rails'

# Rails 5 HTML sanitizer
gem 'rails-html-sanitizer'

# Allow OpenURI to follow HTTP -> HTTPS redirections
gem 'open_uri_redirections'

# Utilities for OpenStax websites
gem 'openstax_utilities'

# Cron job scheduling
gem 'whenever'

# OpenStax Accounts integration
gem 'openstax_accounts', git: 'https://github.com/Dantemss/accounts-rails.git',
                         ref: '9665c8d37b83b83eeb9717c287754a8c3d556956'

# Respond_with and respond_to methods
gem 'responders'

# Access control for API's
gem 'doorkeeper', '~> 1.4.1' # Update to doorkeeper 2.0 requires openstax_api update

# API versioning and documentation
gem 'openstax_api'
gem 'apipie-rails'
gem 'maruku'
gem 'representable'
gem 'roar-rails'
gem 'roar', '~> 0.12.9' # Update to roar 1.0 requires openstax_api update

# Lev framework
gem 'lev'

# Ruby dsl for SQL queries
gem 'squeel', git: 'https://github.com/danielrhodes/squeel.git',
              ref: 'e7f016834eba7f31ed94cb59ed5d41ee80739dd2' # Rails 4.2 patch

# Contract management
gem 'fine_print'

# Keyword search
gem 'keyword_search'

# File uploads
gem 'remotipart'
gem 'carrierwave'

# Image editing
gem 'mini_magick'

# Embedded JavaScript templates
gem 'ejs'

# Embedded CoffeeScript templates
gem 'eco'

# Real time application monitoring
gem 'newrelic_rpm'

# YAML database backups
gem 'yaml_db'

# Admin console
gem 'rails_admin'

group :development, :test do
  # Thin webserver
  gem 'thin'

  # SQLite3 database
  gem 'sqlite3'

  # Call 'debugger' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Use RSpec for tests
  gem 'rspec-rails'

  # Mute asset pipeline log messages
  gem 'quiet_assets'

  # Fixture replacement
  gem 'factory_girl_rails'

  # Lorem Ipsum
  gem 'faker'
end

group :development do
  # Automated security checks
  gem 'brakeman'

  # Time travel gem
  gem 'timecop'

  # Command line reference
  gem 'cheat'

  # Assorted generators
  gem 'nifty-generators'

  # Class diagrams
  gem 'rails-erd'
  gem 'railroady'

  # CoffeeScript source maps
  gem 'coffee-rails-source-maps'
end

group :test do
  # Spec helpers
  gem 'shoulda-matchers', require: false

  # Code Climate integration
  gem "codeclimate-test-reporter", require: false

  # Coveralls integration
  gem 'coveralls', require: false
end

group :production do
  # Unicorn production server
  gem 'unicorn'

  # PostgreSQL production database
  gem 'pg'

  # Notify developers of Exceptions in production
  gem 'exception_notification'
end
