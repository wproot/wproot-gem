# -*- encoding: utf-8 -*-
require File.expand_path('../lib/wproot/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Utkarsh Kukreti"]
  gem.email         = ["utkarshkukreti@gmail.com"]
  gem.description   = %q{WPRoot WordPress Theme Framework}
  gem.summary       = %q{WPRoot WordPress Theme Framework}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "wproot"
  gem.require_paths = ["lib"]
  gem.version       = WPRoot::VERSION

  gem.add_dependency 'compass', '~> 0.12.alpha.0'
  gem.add_dependency 'fssm', '~> 0.2.7'
  gem.add_development_dependency 'rspec', '~> 2.7.0'
end
