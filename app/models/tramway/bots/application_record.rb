module Tramway
  module Bots
    class ApplicationRecord < Tramway::Core::ApplicationRecord
      self.abstract_class = true
    end
  end
end
