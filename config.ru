$:.unshift(File.expand_path("..", __FILE__))
require 'config/boot'
require 'config/application'

Application.each do |path, controller|
  map(path){ run controller}
end
