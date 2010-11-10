# -*- encoding: utf-8 -*-
require File.expand_path("../lib/colorist/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "colorist"
  s.version     = Colorist::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Josep M. Bach', 'Josep Jaume Rey', 'Oriol Gual']
  s.email       = ['info@codegram.com']
  s.homepage    = "http://github.com/codegram/colorist"
  s.summary     = "Easily extract the colors of any image file!"
  s.description = "Easily extract the colors of any image file!"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "colorist"

  s.add_runtime_dependency "color-namer"

  s.add_development_dependency "bundler", ">= 1.0.3"
  s.add_development_dependency "rspec", ">= 2.1.0"
  s.add_development_dependency "simplecov"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end