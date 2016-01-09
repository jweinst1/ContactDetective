# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ContactDetective/version'

Gem::Specification.new do |spec|
  spec.name          = "ContactDetective"
  spec.version       = ContactDetective::VERSION
  spec.authors       = ["Joshua Weinstein"]
  spec.email         = ["jweinst1@berkeley.edu"]

  spec.summary       = %q{A simple API for extracting contact data out of text or HTML links.}
  spec.description   = %q{A simple Ruby API for extracting contact data, such as emails, addresses, and phone numbers from
text documents and hyperlinks. Also has the ability to save the extracted data as JSON objects and files. For more info, see https://github.com/jweinst1/ContactDetective}
  spec.homepage      = "https://github.com/jweinst1/ContactDetective"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
