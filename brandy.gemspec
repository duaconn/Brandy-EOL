# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "brandy/version"

Gem::Specification.new do |s|
  s.name        = "brandy"
  s.version     = Brandy::VERSION
  s.authors     = ["Duane Conn"]
  s.email       = ["duane.conn@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Summary}
  s.description = %q{Write a gem description}

  s.rubyforge_project = "brandy"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
