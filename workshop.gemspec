
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "workshop/version"

Gem::Specification.new do |spec|
  spec.name          = "workshop"
  spec.version       = Workshop::VERSION
  spec.authors       = ["Амир Хасанов"]
  spec.email         = ["aworldx@gmail.com"]

  spec.summary       = %q{hexlet workshop}
  spec.description   = %q{hexlet workshop}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "byebug"
  spec.add_dependency "nokogiri", "~> 1.6"
end
