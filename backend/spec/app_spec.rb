require './app'
require 'spec_helper'
require 'pry'
# set :environment, :test

describe 'News app' do
  describe "/api/v1/news" do
    specify "number of orders places" do
      get "/api/v1/news"
      expect(last_response.status).to eq(200)
      response = JSON.parse(last_response.body)
      expect(response["orders_placed"]).to eq(89)
    end
  end
end
