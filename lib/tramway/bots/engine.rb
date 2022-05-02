module Tramway
  module Bots
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::Bots
    end
  end
end
