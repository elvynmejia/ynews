require 'nokogiri'
require 'open-uri'

Y_C_NEWS_URL = 'https://news.ycombinator.com/'.freeze

module Services
  class News
    def self.get_news(page)
        query = ['p', page].join('=')
        url = [Y_C_NEWS_URL, query].join('?')
        URI.open(url)
    end

    def self.parse_links(page=1)
        html = Nokogiri::HTML(
            self.get_news(page)
        )

        nodes = html.css('.athing').css('.titleline > a')

        nodes.each_with_object({}) do |node, memo|
          memo[node.text] = node['href']
        end
    end
  end
end
