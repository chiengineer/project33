class ComicController
  get '/comics' do

    status 200
    json comics: 'hello'
  end
end
