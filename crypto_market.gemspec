# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "crypto_market/version"

Gem::Specification.new do |spec|
  spec.name          = "crypto-market"
  spec.version       = CryptoMarket::VERSION
  spec.authors       = ["Sam Ojling"]
  spec.email         = ["s.ojling@gmail.com"]

  spec.summary       = %q{CLI that display data from coinmarketcap.com}
  spec.description   = %q{Crypto Market CLI will display data from the top 100 cryptocurrencies, it will let you sort data based on price and most postivive/negative changed coins}
  spec.homepage      = "https://github.com/scarsam"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables   = "crypto-market"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'pry', '~> 0.10.4'
  spec.add_runtime_dependency 'terminal-table', '~> 1.8'
end
