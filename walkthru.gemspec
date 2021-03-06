# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'walkthru/version'

Gem::Specification.new do |gem|
  gem.name          = "walkthru"
  gem.version       = Walkthru::VERSION
  gem.authors       = ["Mark Rushakoff"]
  gem.email         = ["mark.rushakoff@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('highline', '~> 1.6')
  gem.add_dependency('logging', '~> 1.8')

  gem.add_development_dependency('rspec', '~> 2.12')
end
