source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use pg as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use bootstrap
gem 'bootstrap-sass', '~> 3.4.1'

# Use user authetication
gem 'activeadmin'
gem 'devise'
gem 'inherited_resources', '~> 1.7'

# Use carrierwave for photo uploading feature
gem 'carrierwave'
gem 'cloudinary'

# Use simple form
gem 'simple_form'

# Use custom inputs to get image previews
gem 'simple_form_fancy_uploads'

# Use like/unlike gem
gem 'acts_as_votable', '~> 0.11.1'

# Use font-awesome icons
gem 'font-awesome-sass', '~> 4.6.2'

# Use Pagination
gem 'will_paginate'
gem 'bootstrap-will_paginate'

# Use simplified pagination
gem 'kaminari'

# to define web server
gem 'unicorn'
gem 'thin'

# Jquery file upload
gem "jquery-fileupload-rails"

# for encryption of sensitive data
gem 'figaro'

# style the data confirm modal
gem 'data-confirm-modal'

# custom error pages
gem 'exception_handler', '~> 0.8.0.0'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem 'better_errors'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
