require 'grape'
require 'json'
require 'pry'
require_relative '../models/customers'

module Reverb
  class API < Grape::API
    version 'v1', using: :header, vendor: 'goddess herself'
    format :json
    prefix :api

    helpers do
      def customer_list
        @customer_list ||= Customers.new
      end
    end

    resource :customers do
      desc 'Posts a new user to the db'
      post ':data' do
        new_customer = CSVParser.parse_row(:data, params[:delimiter])
        customers.add(new_customer)
      end

      desc 'Updates an existing user in the db'
      put ':data' do
        new_customer = CSVParser.parse_row(:data, params[:delimiter])
        customers.add(new_customer)
      end

      desc 'Returns all users in the db sorted by [gender, lname] as a json object'
      get '/by-gender' do
        customers.refresh!.by_gender.to_json
      end

      desc 'Returns all users in the db sorted by last name desc as a json object'
      get '/by-lname' do
        customers.refresh!.to_json
      end

      desc 'Returns all users in the db sorted by date of birth as a json object'
      get '/by-date_of_birth' do
        customers.refresh!.to_json
      end
    end
  end
end
