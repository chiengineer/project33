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
    #search the local library folder
  end

end
