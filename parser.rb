require 'open-uri'
require 'nokogiri'
require_relative 'item'

class Parser
  def initialize(url)
    @url = url
  end

  def parse_items()
    html = URI.open(@url) { |result| result.read }

    document = Nokogiri::HTML(html)
    content = document.css('li.catalog-grid__cell')

    document.css('li.catalog-grid__cell').map do |data_item|
      initialize_item(data_item)
    end
  end

  def initialize_item(data_item)
    Item.new(
      data_item.css('div.g-id').text.strip,
      data_item.css('.goods-tile__heading.ng-star-inserted').text.strip,
      data_item.css('.goods-tile__price').text.strip
    )
  end
end
