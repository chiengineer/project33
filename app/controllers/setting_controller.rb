require 'controllers/base_controller'

class SettingController < BaseController
  get '/' do

    status 200
    {settings: 'OK'}.to_json
  end
end
