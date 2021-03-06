# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paypal/csv/reports/version'

Gem::Specification.new do |spec|
  spec.name          = 'paypal-csv-reports'
  spec.version       = Paypal::Csv::Reports::VERSION
  spec.authors       = ['Laurynas Butkus']
  spec.email         = ['laurynas.butkus@gmail.com']
  spec.summary       = %q{Simple PayPal CSV report parser}
  spec.description   = %q{Parses PayPal case report CSV}
  spec.homepage      = 'https://github.com/laurynas/paypal-csv-reports'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
