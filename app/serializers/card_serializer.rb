require 'nokogiri'

class CardCollectionSerializer
  def initialize(comic_vine_collection: [], library_collection: [], minimal: false)
    @comic_vine_collection  = comic_vine_collection
    @library_collection     = library_collection
    @minimal                = minimal
    @results                = []
  end

  def perform
    @comic_vine_collection.each do |comic|
      @results << process_comic_vine_object(comic: comic, minimal: @minimal)
    end

    @library_collection.each do |comic|
      @results << process_library_object(comic: comic, minimal: @minimal)
    end
    @results
  end

  def process_comic_vine_object(comic: nil, minimal: true)
    response =  {
                  meta: {
                    source:    'comic_vine'
                  },
                  header: {
                    id:        comic['id'],
                    title:     comic['name'],
                    subtitle:  comic['publisher']['name'],
                  },
                  images: {
                    thumb_url:  comic['image']['thumb_url'],
                    medium_url: comic['image']['medium_url']
                  },
                  actions:
                    [{ title:  'Add to Library',
                       method: 'POST',
                       path:   '/comics/volume',
                       params: {series_id: comic['id']}},
                     { title: 'View on ComicVine',
                       method: 'external_url',
                       external_url: comic['site_detail_url']}]
                }
    if !minimal
      response[:header].merge!({
        badge: comic['count_of_issues']
        })
      description, blurb = process_description(comic['description'])
      if !description.nil?
        response.merge!({body: {
          blurb: blurb,
          text:  description
          }})
      end
    end
    response
  end

  def process_library_object(comic: nil, minimal: false)

  end

  def process_description(description)
    return if description.nil?
    doc = Nokogiri::HTML(description).xpath("//*[not(child::*)]").map(&:text).join(' ')
    blurb = if doc.length > 250
      blurb_index = 249+doc[250..-1].partition(' ')[0].length
      doc[0..blurb_index] + '...'
    else
      doc
    end
    [doc, blurb]
  end

end
