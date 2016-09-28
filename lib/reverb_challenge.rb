require_all 'models/'
require_all 'specs/'

module ReverbChallenge
  class << self
    def data_layer
      DataLayer.new(Configuration)
    end
  end
end
