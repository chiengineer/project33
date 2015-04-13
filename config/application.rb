require 'controllers/comic_controller'
require 'controllers/setting_controller'
require 'controllers/search_controller'

Application = {
  '/comics'               => ComicController,
  '/settings'             => SettingController,
  '/search'               => SearchController
}
