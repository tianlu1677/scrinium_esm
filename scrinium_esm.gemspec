$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "scrinium_esm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "scrinium_esm"
  s.version     = ScriniumEsm::VERSION
  s.authors     = ["Li Dong"]
  s.email       = ["dongli@lasg.iap.ac.cn"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ScriniumEsm."
  s.description = "TODO: Description of ScriniumEsm."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"
  s.add_dependency 'globalize', '~> 5.0.0'
end
