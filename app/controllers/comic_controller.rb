require 'controllers/base_controller'
require 'interactors/library_interactor'

class ComicController < BaseController
  get '/' do
    folders = LibraryInteractor.new

    status 200
    {:library => folders.get_folders}.to_json
  end

  post '/publishers' do
    param :name, String

  end

end
