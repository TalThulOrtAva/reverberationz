require '../models/customer'
require '../models/customer_parser'

module Reverb
  class API < Grape::API
    version 'v1', using: :header, vendor: 'goddess herself'
    format :json
    prefix :api

    helpers do
      def something
        # TODO
      end

      def something_else
        # TODO
      end
    end

    resource :customers do
      desc 'return whatever'
      get :sort do
        # TODO
      end
    end
  end
end
