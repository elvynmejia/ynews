# frozen_string_literal: true

require './app/services/news'

module Api
  module V1
    # news api class
    class News
      def self.find(page = 1)
        Services::News.parse_links(page)
      end
    end
  end
end
