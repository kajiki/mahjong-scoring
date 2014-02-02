# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mahjong_scoring/version'

Gem::Specification.new do |spec|
  spec.name          = "mahjong-scoring"
  spec.version       = MahjongScoring::VERSION
  spec.authors       = ["Janko Luin", "Jessica Hanmeier"]
  spec.email         = ["janko@luin.se", "jessica@esperanto.se"]
  spec.description   = %q{Calculate the score of a Mahjong hand}
  spec.summary       = %q{Calculate the score of a Mahjong hand}
  spec.homepage      = "https://github.com/kajiki/mahjong-scoring"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"
  spec.add_development_dependency "guard", "~> 2.2.5"
  spec.add_development_dependency "guard-rspec", "~> 4.2.5"
end
