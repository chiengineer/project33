require 'rack/parser'
require 'rack-livereload'
require 'sinatra/base'
require 'sinatra/param'
require 'json'

class BaseController < Sinatra::Base
  enable :logging
  disable :show_exceptions
  use Rack::Parser
  helpers Sinatra::Param

  before do
    content_type :json
  end
end
