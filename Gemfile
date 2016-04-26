source 'https://rubygems.org'
ruby '2.3.0'

# rails
gem 'rails', '>= 4.1.14.1', '< 4.2'

# database & models
gem 'active_model_serializers', '0.8.1'
gem 'jbuilder', '~> 1.2'
gem 'mysql2', '~> 0.3.18'

# authentication/authorization
gem 'bcrypt'
gem 'devise', '3.2.4'
# misc

gem 'actionpack-page_caching'
gem 'addressable', '~> 2.4'
gem 'angular-ui-bootstrap-rails'
gem 'angular_rails_csrf'
gem 'angularjs-rails-resource', '~> 1.1.1'
gem 'bower-rails'
gem 'browser'
gem 'bugsnag', '~> 3.0'
gem 'carrierwave'
gem 'clockwork'
gem 'coffee-rails', '~> 4.0.0'
gem 'fog', '~> 1.37'
gem 'font-awesome-rails'
gem 'font_assets', '~> 0.1.12'
gem 'haml-rails'
gem 'httparty'
gem 'jquery-rails'
gem 'less-rails', '~> 2.7', '>= 2.7.1'
gem 'less-rails-bootstrap', '~> 3.3', '>= 3.3.5.0'
gem 'mass_mandrill'
gem 'mini_magick'
gem 'net-ssh', '~> 3.0', '>= 3.0.2'
gem 'rack-timeout', '~> 0.3.2'
gem 'randumb', '~> 0.5.0'
gem 'rollbar', '~> 2.7.1'
gem 'sass-rails'
gem 'slim-rails', '~> 3.0', '>= 3.0.1'
gem 'strip_attributes'
gem 'sunspot_rails'
gem 'therubyracer', '~> 0.12.2'
gem 'uglifier', '>= 1.3.0'

group :production do
  gem 'newrelic_rpm'
  gem 'rails_12factor', '~> 0.0.3' # heroku
end

# production
# gem 'lograge'
gem 'puma', '~> 2.16'

# FIXME: extract :test environment where possible
group :development, :test do
  gem 'awesome_print'
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
  gem 'binding_of_caller'
  gem 'bullet', '~> 5.0' # Fix N+1 queries
  gem 'byebug'
  gem 'capybara', '~> 2.6', '>= 2.6.2'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'faker'
  gem 'guard', '~> 2.13'
  gem 'guard-bundler', '~> 2.1', require: false
  gem 'guard-livereload', '~> 2.5', '>= 2.5.2', require: false
  gem 'guard-pow', '~> 2.0'
  gem 'guard-puma', '~> 0.3.1', require: false
  gem 'guard-rspec', '~> 4.6', '>= 4.6.4'
  gem 'jazz_hands2', '~> 1.0', '>= 1.0.2'
  gem 'letter_opener' # open sent emails in a browser
  gem 'powder', '~> 0.3.0' # Manages pow server
  gem 'pry-byebug'
  gem 'railroady', '~> 1.4', '>= 1.4.2' # Visualize model and controller as UML and output to SVG
  gem 'rails_best_practices', '~> 1.16', require: false
  gem 'rspec-rails'
  gem 'rubocop', '~> 0.37.2', require: false # Ruby/Rails syntax linting
  gem 'ruby-lint', '~> 2.1'
  gem 'rubycritic', require: false
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'simplecov'
  gem 'sqlite3'
  gem 'sunspot_solr'
end

group :test do
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
end
