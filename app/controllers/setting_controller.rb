class SettingsController
  get '/settings' do
    status 200
    json settings: 'OK'
  end
end
