require 'httparty'

class CV
  include HTTParty
  base_uri 'api.comicvine.com'
  MINIMAL_FIELDS = ["name", "id", "publisher", "image", "api_detail_url", "site_detail_url"]
  DEFAULT_FIELDS = ["first_issue", "start_year", "description", "count_of_issues"] + MINIMAL_FIELDS



  def initialize(limit: 10, fields: DEFAULT_FIELDS, format: 'json', minimal: false)
    fields = MINIMAL_FIELDS if minimal
    @options = {query: {
                  api_key: ENV['COMIC_VINE_API_KEY'],
                  format: format,
                  limit: limit,
                  field_list: fields.join(',') }
                }
  end

  def search(type: 'volume', name: [], id: [])
    @options[:query][:filter] = []
    name.each { |n| @options[:query][:filter] << 'name:' + n } unless name.empty?
    id.each { |i| @options[:query][:filter] << 'id:' + i } unless id.empty?

    self.class.get("/volumes/", @options)
  end

  def volume(name:)
    @options[:query][:name] = query

    self.class.get("/volumes", @options)
  end

end
