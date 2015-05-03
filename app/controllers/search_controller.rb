require 'interactors/library_interactor'
require 'interactors/cv_interactor'
require 'serializers/card_serializer'

class SearchController < BaseController
  set :protection, :except => [:json_csrf]

  get '/comicvine' do
    param   :query,     Array
    param   :id,        Array
    param   :minimal,   Boolean, default: false
    param   :raw,       Boolean, default: false
    any_of  :query, :id

    comic_vine = CV.new(minimal: params[:minimal])
    results = comic_vine.search(name: params[:query]).parsed_response['results']
    response = if params[:raw]
      results
    else
      CardCollectionSerializer.new(comic_vine_collection: results, minimal: params[:minimal]).perform
    end

    status 200
    {response: response}.to_json
  end

  get '/library' do
    folders = LibraryInteractor.new

    status 200
    {:library => folders.get_folders}.to_json
  end

end
