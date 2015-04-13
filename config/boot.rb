env = ENV['RACK_ENV'] || 'development'
require 'bundler'
Bundler.setup(:default, env)
require 'dotenv'
Dotenv.load

$: << File.expand_path('../../app', __FILE__)

# Dir['./config/initializers/**/*.rb'].each{|file| require file}
