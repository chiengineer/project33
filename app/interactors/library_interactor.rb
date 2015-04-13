require "pathname"

class LibraryInteractor
  attr_accessor :library

  def initialize
    self.library = Pathname.new(ComicDirectory)
  end

  def get_folders
    self.library.children.select { |c| c.directory? }
  end
end
