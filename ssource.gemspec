# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ssource/version'

Gem::Specification.new do |spec|
  spec.name          = 'ssource'
  spec.version       = Ssource::VERSION
  spec.authors       = ['draveness']
  spec.email         = ['i@draveness.me']

  spec.summary       = 'A ruby wrapper for SourceKitten.'
  spec.description   = 'A ruby wrapper for SourceKitten.'
  spec.homepage      = 'https://github.com/Draveness/ssource'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = %w(README.md LICENSE) + Dir['lib/**/*.rb']
  spec.executables   = %w(ss)
#  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'claide',        '>= 1.0.1', '< 2.0'
  spec.add_runtime_dependency 'activesupport', '~> 5.0'
  spec.add_runtime_dependency 'colorize',      '~> 0.8.1'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
