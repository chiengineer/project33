require 'controllers/base_controller'

class ComicController < BaseController
  get '/' do
    status 200
    {:hello => 'world'}.to_json
  end
end
