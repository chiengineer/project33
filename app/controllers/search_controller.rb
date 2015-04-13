require 'interactors/library_interactor'
require 'interactors/cv_interactor'

class SearchController < BaseController
  get '/comicvine' do
    param :name,  Array
    param :id,    Array

    results = CV.new.search(name: params[:name])

    status 200
    {response: results}.to_json
  end

  get '/library' do
    folders = LibraryInteractor.new

    status 200
    {:library => folders.get_folders}.to_json
  end

end
