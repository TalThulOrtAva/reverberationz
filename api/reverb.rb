require 'grape'
require 'json'
require 'pry'
require_relative '../models/customers'

module Reverb
  class API < Grape::API
    format :json
    prefix :api

    helpers do
      def customers
        @customers ||= Customers.new
      end
    end

    resource :customers do
      desc 'Posts a new user to the db'
      post '' do
        new_customer = CSVParser.parse_row(:data, params[:delimiter])
        customers.add(new_customer)
      end

      desc 'Returns all users in the db'
      get '' do
        customers.sort(params['sort'])
      end
    end
  end
end
