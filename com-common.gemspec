# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "com/common/version"


Gem::Specification.new do |spec|
  spec.name    = "com-common"
  spec.version = ::Com::Common::VERSION
  spec.authors = ["Zeke Fast"]
  spec.email   = ["zekefast@gmail.com"]

  spec.summary  = %q{com-rb common library classes.}
  spec.homepage = "https://github.com/com-rb/com-common"
  spec.license  = "GNU GPL Version 3"

  spec.required_ruby_version = "~> 2.3.1"
  spec.files                 = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir                = "exe"
  spec.executables           = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths         = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12.5"
  spec.add_development_dependency "rake",    "~> 11.2"
  spec.add_development_dependency "rspec",   "~> 3.5"
end
