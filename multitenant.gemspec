# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "glamorous_validation_jp/version"

Gem::Specification.new do |s|
  s.name        = "glamorous_validation_jp"
  s.version     = GlamorousValidationJp::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Hirohide Sano"]
  s.email       = ["sanojimaru@gmail.com"]
  s.homepage    = "http://github.com/sanojimaru/glamorous_validation_jp"
  s.summary     = %q{Some useful validators for sexy validation}
  s.description = %q{Some useful validators for sexy validation.}

  s.rubyforge_project = "glamorous_validation_jp"

  s.add_dependency(%q<activerecord>, ['>= 3.1'])
  s.add_development_dependency(%q<sqlite3>, ["~> 1.3.3"])
  s.add_development_dependency(%q<rspec>, ['~> 2.6.0'])
  s.add_development_dependency(%q<rspec-core>, ['~> 2.6.4'])

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
