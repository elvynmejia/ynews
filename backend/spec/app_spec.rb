# frozen_string_literal: true

require './app'
require 'spec_helper'
require 'pry'

describe 'Application' do
  describe '/api/v1/news' do
    specify 'number of orders places' do
      get '/api/v1/news'
      puts last_response
      expect(last_response.status).to eq(200)
      response = JSON.parse(last_response.body)
      expect(response.is_a?(Hash)).to be_truthy
    end
  end
end
