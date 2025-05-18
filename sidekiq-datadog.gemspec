# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidekiq/datadog/version'

Gem::Specification.new do |s|
  s.name          = 'sidekiq-datadog'
  s.version       = Sidekiq::Datadog::VERSION.dup
  s.authors       = ['Dimitrij Denissenko']
  s.email         = ['dimitrij@blacksquaremedia.com']
  s.description   = 'Datadog metrics for sidekiq (Shipup Version)'
  s.summary       = 'Datadog metrics for sidekiq (Shipup Version)'
  s.homepage      = 'https://github.com/getshipup/sidekiq-datadog'

  s.files         = Dir['lib/**/*.rb']
  s.require_paths = ['lib']
  s.required_ruby_version = '~> 3.0'

  s.add_dependency('dogstatsd-ruby', '>= 5.2')
  s.add_dependency('sidekiq')
  s.metadata['rubygems_mfa_required'] = 'true'
end
