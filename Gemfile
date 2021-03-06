ruby '2.3.1'
source 'http://rubygems.org'

# Main
gem 'rake', '11.3.0'
gem 'rails', '~> 5.1'
gem 'pg'
gem 'sidekiq'
gem 'coffee-rails'
gem 'jbuilder', '~> 2.0'
gem 'slim-rails', '3.1.1'
gem 'bcrypt-ruby', require: 'bcrypt'
gem 'mini_magick'
gem 'searchkick'
gem 'rabl'
gem 'oj'
gem 'friendly_id', '~> 5.1.0'

# Trailblazer
gem 'trailblazer'
gem 'trailblazer-rails'
gem 'trailblazer-cells'

# Forms
gem 'simple_form'

# Rails core extensions
gem 'cells'
gem 'draper'
gem 'configatron'
gem 'figaro'
gem 'render_anywhere'
gem 'inherited_resources'
gem 'wicked'
gem 'dry-validation'
gem 'recursive-open-struct'

# Activerecord extensions
gem 'baby_squeel'
gem 'awesome_nested_set'
gem 'enumerize'
gem 'aasm'
gem 'acts_as_list'

# Authorization, roles
gem 'devise'
gem 'devise_lastseenable'
gem 'pundit'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'
gem 'omniauth-odnoklassniki'

# Admin
gem 'activeadmin'
gem 'activeadmin_addons'
gem 'activeadmin_reorderable', github: 'delphist/activeadmin_reorderable', branch: 'feature/add-belongs-to-support'
gem 'kaminari', github: 'kaminari/kaminari', ref: 'e95bb74'
gem 'ckeditor'

# Excel
gem 'zip-zip'
gem 'roo'
gem 'roo-xls'
gem 'axlsx'

# Attachments
gem 'rmagick', require: false
gem 'carrierwave', '~> 1.0'
gem 'avatarly'

# API
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'
gem 'grape-swagger-entity'
gem 'hashie-forbidden_attributes'
gem 'httparty'

# Frontend
gem 'uglifier'
gem 'erubis'
gem 'yui-compressor'
gem 'webpacker', '~> 3.0'
gem 'react-rails'
gem 'mini_racer', platforms: :ruby

# Misc
gem 'russian', '~> 0.6.0'
gem 'phony_rails'
gem 'translit'
gem 'nokogiri'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'foreman'
gem 'dotiw'
gem 'sitemap_generator'
gem 'whenever', require: false

# External services
gem 'newrelic_rpm'
gem 'rollbar'

# CHECK
gem 'petrovich', '~> 1.0'
gem 'simple_captcha2', require: 'simple_captcha'
gem 'ipgeobase', git: 'https://github.com/mokevnin/ipgeobase'
gem 'meta-tags', require: 'meta_tags'

group :development, :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'capybara-webkit'
  gem 'capybara-screenshot'
  gem 'capybara-vue'

  gem 'rspec'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-byebug', require: false
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'spring'
  gem 'rails-controller-testing'
end

group :development do
  gem 'slackistrano'
  gem 'annotate'
  gem 'rubocop', require: false
  gem 'rubocop-rspec-focused', require: false
  gem 'ruby_parser', require: false
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
  gem 'capistrano', '~> 3.7'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-rvm'
  gem 'capistrano3-puma', github: 'seuros/capistrano-puma'
  gem 'capistrano-yarn'
  gem 'capistrano-sidekiq'
end

group :test do
  gem 'rspec-sidekiq'
  gem 'rspec-its'
  gem 'rspec-rails', require: false
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
  gem 'shoulda', '~> 3.5'
  gem 'shoulda-matchers', '~> 2.0'
end

group :production do
  gem 'puma', '3.8.1'
end
