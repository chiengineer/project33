require 'controllers/comic_controller'
require 'controllers/setting_controller'
require 'controllers/search_controller'

Application = {
  '/api/comics'               => ComicController,
  '/api/settings'             => SettingController,
  '/api/search'               => SearchController
}
