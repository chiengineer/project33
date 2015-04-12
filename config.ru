$:.unshift(File.expand_path("..", __FILE__))
require 'config/boot'
require 'config/application'
run Application
