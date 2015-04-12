env = ENV['RACK_ENV'] || 'development'
require 'bundler'
Bundler.setup(:default, env)

$: << File.expand_path('../../app', __FILE__)

# Dir['./config/initializers/**/*.rb'].each{|file| require file}
