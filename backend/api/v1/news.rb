require 'nokogiri'
require 'open-uri'

Y_C_NEWS_URL = 'https://news.ycombinator.com/'.freeze

def get_news(page=1)
    query = ['p', page].join('=')
    url = [Y_C_NEWS_URL, query].join('?')
    URI.open(url)
end

def parse_links()
    html = Nokogiri::HTML(
        get_news()
    )

    html.css('.athing').css('.titleline > a').each_with_object({}) do |node, memo|
      memo[node.text] = node['href']
    end
    rescue => e
        puts e
end

puts parse_links()
