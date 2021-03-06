$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "samson_deploy_lockchecker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "deploy_lockchecker"
  s.version     = SamsonDeployLockchecker::VERSION
  s.authors     = ["Redbubble"]
  s.email       = ["delivery-engineers@redbubble.com"]
  s.homepage    = "https://github.com/redbubble/samson-deploy-lockchecker"
  s.summary     = "A Samson plugin that sends email if the deployment is locked."
  s.description = "A Samson plugin that sends email if hte deployment is locked."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE.txt", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_development_dependency "minitest"
  s.add_development_dependency "maxitest"
  s.add_development_dependency "mocha"
end
