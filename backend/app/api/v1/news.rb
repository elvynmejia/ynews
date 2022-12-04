require './app/services/news'

module Api
  module V1
    class News
      def self.find(page=1)
        Services::News.parse_links(page)
      end
    end
  end
end
