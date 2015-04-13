require 'controllers/base_controller'

class ComicController < BaseController
  get '/' do
    status 200
  end

  post '/volume' do
    param :series_id, String

  end

end
