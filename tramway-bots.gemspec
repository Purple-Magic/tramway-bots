require_relative "lib/tramway/bots/version"

Gem::Specification.new do |spec|
  spec.name        = "tramway-bots"
  spec.version     = Tramway::Bots::VERSION
  spec.authors     = ["Pavel Kalashnikov"]
  spec.email       = ["kalashnikovisme@gmail.com"]
  spec.homepage    = "https://github.com/Purple-Magic/tramway-bots"
  spec.summary     = "Rails Engine for bot management"
  spec.summary     = "Rails Engine for bot management"
  spec.license     = "MIT"
  
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end
end
