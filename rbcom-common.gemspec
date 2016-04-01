lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "rbcom/common/version"


Gem::Specification.new do |spec|
  spec.name          = "rb.com-common"
  spec.version       = ::Rbcom::Common::VERSION
  spec.authors       = ["Zeke Fast"]
  spec.email         = ["zekefast@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = ""
  end

  spec.summary       = %q{Rbcom common library classes.}
  spec.homepage      = "https://github.com/rbcom/rbcom-common"
  spec.license       = "MIT"

  spec.required_ruby_version = "~> 2.3.0"
  spec.files                 = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir                = "exe"
  spec.executables           = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths         = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11.2"
  spec.add_development_dependency "rake",    "~> 11.1"
end
