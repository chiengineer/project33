require 'interactors/library_interactor'
require 'interactors/cv_interactor'

class SearchController < BaseController
  set :protection, :except => [:json_csrf]

  get '/comicvine' do
    param   :query,     Array
    param   :id,        Array
    param   :minimal,   Boolean, default: false
    any_of  :query, :id

    comic_vine = CV.new(minimal: params[:minimal])
    results = comic_vine.search(name: params[:query])

    status 200
    {response: results}.to_json
  end

  get '/library' do
    folders = LibraryInteractor.new

    status 200
    {:library => folders.get_folders}.to_json
  end

end
