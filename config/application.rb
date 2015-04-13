require 'controllers/comic_controller'
require 'controllers/setting_controller'

Application = {
  '/comics'               => ComicController,
  '/settings'             => SettingController,
}
