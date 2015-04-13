require 'controllers/base_controller'
require 'interactors/library_interactor'
require 'interactors/cv_interactor'

class ComicController < BaseController
  get '/' do
    folders = LibraryInteractor.new

    status 200
    {:library => folders.get_folders}.to_json
  end

  post '/volume' do
    param :series_id, String

  end

end
