require 'controllers/base_controller'

class SettingController < BaseController
  get '/settings' do

    status 200
    json settings: 'OK'
  end
end
