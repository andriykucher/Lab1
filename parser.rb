require 'open-uri'
require 'nokogiri'

class Parser
  def parse_items(url)
    html = URI.open(url) { |result| result.read }

    document = Nokogiri::HTML(html)
    content = document.css('li.catalog-grid__cell')

    data =
      document.css('li.catalog-grid__cell').map do |item|
        {
          code: item.css('div.g-id').text.strip,
          name: item.css('.goods-tile__heading.ng-star-inserted').text.strip,
          price: item.css('.goods-tile__price').text.strip
        }
    end
    return data
  end
end
