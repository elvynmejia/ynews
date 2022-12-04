# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

module Services
  # news service
  class News
    def self.get_news(page)
      query = ['p', page].join('=')
      url = ['https://news.ycombinator.com/', query].join('?')
      # rubocop:disable Security/Open
      URI.open(url)
      # rubocop:enable Security/Open
    end

    def self.parse_links(page = 1)
      html = Nokogiri::HTML(
        get_news(page)
      )

      nodes = html.css('.athing').css('.titleline > a')

      nodes.each_with_object({}) do |node, memo|
        memo[node.text] = node['href']
      end
    end
  end
end
