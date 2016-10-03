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
        customers.refresh!
        customers.to_h
      end

      desc 'Returns all users in the db sorted by [gender, lname] as a json object'
      get '/by-gender' do
        customers.refresh!.by_gender.json
      end

      desc 'Returns all users in the db sorted by last name desc as a json object'
      get '/by-lname' do
        customers.refresh!.json
      end

      desc 'Returns all users in the db sorted by date of birth as a json object'
      get '/by-date_of_birth' do
        customers.refresh!.json
      end
    end
  end
end
