# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tags/version"

Gem::Specification.new do |s|
  s.name= "tags"
  s.version = Tags::VERSION
  s.platform= Gem::Platform::RUBY
  s.authors = ["Austin Schneider"]
  s.email = ["soccer022483@gmail.com"]
  s.homepage= "http://github.com/soccer022483/tags"
  s.summary = "A Ruby object with the behavior of a list of tags."
  s.description = "A Ruby object with the behavior of a list of tags."
  s.post_install_message = "Thanks for installing Tags!"
  s.files = `git ls-files`.split("\n")
  s.test_files= `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end