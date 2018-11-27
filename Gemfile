source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'

gem 'bcrypt', '3.1.11'

gem 'bootstrap-sass'

gem 'webpacker', github: 'rails/webpacker'

gem 'jp_prefecture'

gem 'fog'

gem 'rails-i18n'

gem 'google-analytics-rails'

gem 'devise'

gem 'meta-tags'

gem 'omniauth'

gem 'omniauth-twitter'

gem 'omniauth-facebook'

gem 'omniauth-google-oauth2'

gem 'less-rails'

gem 'cancancan'

gem 'rails_admin'

gem 'therubyracer'

gem 'execjs'

gem 'bootstrap_form'

gem 'bootstrap-datetimepicker-rails'

gem 'bootstrap-datepicker-rails'

gem 'momentjs-rails'

gem 'ransack'

gem 'country_select'


gem 'will_paginate'

gem 'faker'

gem 'carrierwave',             '1.2.2'
gem 'mini_magick',             '4.7.0'

gem 'bootstrap-will_paginate', '1.0.0'

gem 'jquery-rails'

gem 'jquery-turbolinks'


gem 'sitemap_generator'

#gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'sqlite3' #do ~ end内部に追加。他のgemは残してください。

end

group :production do
  gem 'pg'
end




group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'rails-controller-testing'
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
