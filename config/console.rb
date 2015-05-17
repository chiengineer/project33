require_relative 'boot'
Dir['./app/**/**/*.rb'].each {|file| require file}
