# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tags/version', __FILE__)

Gem::Specification.new do |spec|
  spec.authors       = ["Austin Schneider"]
  spec.email         = ["austinthecoder@gmail.com"]
  spec.description   = "A Ruby object with the behavior of a list of tags."
  spec.summary       = "A Ruby object with the behavior of a list of tags."
  spec.homepage      = "https://github.com/austinthecoder/tags"

  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.name          = "tags"
  spec.require_paths = ["lib"]
  spec.version       = Tags::VERSION

  spec.add_development_dependency "rspec", ">= 2.8"

  spec.add_dependency "activesupport", ">= 3"
end