require 'sinatra/base'
require 'json'
require 'dotenv'
require 'pry'
require 'sinatra/cross_origin'

require './app/api/v1/news'

Dotenv.load('.env')

class Application < Sinatra::Base
  register Sinatra::CrossOrigin

  configure do
    enable :cross_origin
  end

  # routes...
  options "*" do
    response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
    content_type :json
  end

  # work around Shopify API ActiveResource::UnauthorizedAccess error
  get '/api/v1/news' do
    Api::V1::News.news(1).to_json
  rescue
    {}
  end
end
