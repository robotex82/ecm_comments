$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ecm/comments/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_comments"
  s.version     = Ecm::Comments::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/ecm_comments"
  s.summary     = "Ecm::Comments."
  s.description = "Ecm::Comments Module."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,spec}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"
  s.add_dependency "twitter-bootstrap-components-rails"
end
