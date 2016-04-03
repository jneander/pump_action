# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pump_action/version"

Gem::Specification.new do |spec|
  spec.name          = "pump_action"
  spec.version       = PumpAction::VERSION
  spec.authors       = ["Jeremy Neander"]
  spec.email         = ["jeremy.neander@gmail.com"]

  spec.summary       = "A lightweight Rack dev server reloader"
  spec.homepage      = "https://www.github.com/jneander/pump_action"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject {|f| f.match(%r{^(test|spec|features)/})}
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "listen", "~> 3.0", ">= 3.0.3"
  spec.add_runtime_dependency "rack", "~> 1.6", ">= 1.6.4"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
