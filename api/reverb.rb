require 'grape'
require 'json'

class Reverb < Grape::API
  version 'v1', using: :header, vendor: 'goddess herself'
  format :json
  prefix :api

  helpers do
    def customers
      Customers.new.refresh!
    end

    def csv_parser

    end
  end

  resource :customers do
    desc 'return whatever'
    get_customer :sort do
      # TODO
    end
  end
end
