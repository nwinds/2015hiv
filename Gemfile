source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'

# Use mysql2 as the database for Active Record
if defined?(JRUBY_VERSION)
  gem 'activerecord-jdbc-adapter', '>=1.3.0'
  gem 'jdbc-mysql', :require=>false
  gem 'activerecord-jdbcmysql-adapter', '>=1.3.0'
else
  gem 'mysql2'
end


# gem 'mysql2', platform: :ruby
# gem 'jdbc-mysql', platform: :jruby
# gem 'activerecord-jdbcmysql-adapter', platform: :jruby

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyrhino'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Rails (>= 3.1) engine which provides html5boilerplate generators and assets
gem "rails-boilerplate"

# get paging in good way
gem 'will_paginate', '~> 3.0.6'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# ZXing
# Decode QR codes (and other 1D/2D barcode formats)
gem 'jruby-jars', '~> 1.7.19'
gem 'zxing'

# rQRCode is a library for encoding QR Codes. The simple interface allows you 
# to create QR Code data structures ready to be displayed in the way you choose.
gem 'rqrcode', '~> 0.6.0'

# The figaro gem makes it so easy to set configuration variables you may find
#  it useful to set other configuration parameters besides email account 
#  credentials or private API keys.
gem 'figaro'

# This gem provides a simple and extremely flexible way to upload files from 
# Ruby applications. It works well with Rack based web applications, such as Ruby on Rails.
# Multiple file uploads
# Note: You must specify using the master branch to enable this feature
gem 'carrierwave', github:'carrierwaveuploader/carrierwave'

group :development, :test do
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
