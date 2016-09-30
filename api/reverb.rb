require 'grape'

class Reverb < Grape::API
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
    get_customer :sort do
      # TODO
    end
  end
end
