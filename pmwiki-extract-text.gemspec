# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pmwiki/extract/text/version'

Gem::Specification.new do |spec|
  spec.name          = "pmwiki-extract-text"
  spec.version       = Pmwiki::Extract::Text::VERSION
  spec.authors       = ["Tamara Temple"]
  spec.email         = ["tamouse@gmail.com"]

  spec.summary       = %q{Extract text from a PMWiki page and save it to a corresponding txt file}
  spec.homepage      = "https://github.com/tamouse/pmwiki-extract-text"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "pry-nav"
end
