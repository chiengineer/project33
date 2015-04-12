require 'controllers/base_controller'

class ComicController < BaseController
  get '/' do
    "hello new world"
  end
end
