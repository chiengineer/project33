source 'https://rubygems.org'
gem 'sinatra',                    :github => "sinatra/sinatra"
gem 'sinatra-contrib'
gem 'sinatra-param'
gem 'puma'

gem 'dotenv',                     '~> 2.0.1'
gem 'rake',                       '~> 10.4.2'

gem 'activerecord',               '~> 4.2.0'
gem 'sinatra-activerecord',       git: 'git@github.com:janko-m/sinatra-activerecord.git', tag: 'v1.3.0'
gem 'rack-parser',                :require => 'rack/parser'
gem 'rack-livereload',            :group => :development
gem 'httparty'
gem 'nokogiri'

group :development, :test do
  gem 'byebug'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec',                    '~> 3.2.0'
  gem 'rspec_api_documentation',  git: 'git@github.com:zipmark/rspec_api_documentation.git'
  gem 'rack-test'
  gem 'pry'
  gem 'pry-byebug'
end
