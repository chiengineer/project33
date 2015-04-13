$:.unshift(File.expand_path("..", __FILE__))
require 'config/boot'
require 'config/application'
require 'config/user_settings'
require 'sinatra'
require 'sinatra/reloader'

configure :development do
    register Sinatra::Reloader
end

Application.each do |path, controller|
  map(path){ run controller}
end
