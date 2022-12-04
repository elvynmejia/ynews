# frozen_string_literal: true

require 'sinatra/base'
require 'json'
require 'dotenv'
require 'pry'
require 'sinatra/cross_origin'

require './app/api/v1/news'

Dotenv.load('.env')

# main application
class Application < Sinatra::Base
  register Sinatra::CrossOrigin

  configure do
    enable :cross_origin
  end

  options '*' do
    response.headers['Allow'] = 'GET, PUT, POST, DELETE, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token'
    response.headers['Access-Control-Allow-Origin'] = '*'
    200
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
    content_type :json
  end

  get '/api/v1/news' do
    status 200
    Api::V1::News.find(1).to_json
  rescue StandardError
    status 404
    { message: 'News not found', error: 'NOT_FOUND' }
  end
end
