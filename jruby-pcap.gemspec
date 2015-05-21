# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jruby-pcap/version'

Gem::Specification.new do |spec|
  spec.name          = "jruby-pcap"
  spec.version       = Jruby::Pcap::VERSION
  spec.authors       = ["Pere Urbon-Bayes"]
  spec.email         = ["pere.urbon@elastic.co"]

  spec.summary       = "A basic jruby gem wrapper on top of pcap4j"
  spec.description   = "This gem leverages the java lib pcap4j to enable jruby developers to analyse network packets"
  spec.homepage      = "http://github.com/purbon/jruby-pcap"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
