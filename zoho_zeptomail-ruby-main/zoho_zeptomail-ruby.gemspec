# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zoho_zeptomail/version'

Gem::Specification.new do |spec|
  spec.name          = 'zoho_zeptomail-ruby'
  spec.version       = ZohoZeptoMail::VERSION
  spec.authors       = ['ZohoMail']
  spec.email         = ['zmintegration@zohomail.com']
  spec.summary       = "Zoho ZeptoMail official Ruby SDK"
  spec.description   = "Zoho ZeptoMail official Ruby SDK. Interacts with all endpoints at Zoho ZeptoMail API."
  spec.homepage      = 'https://www.zoho.com/zeptomail/'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.1'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = ''
  spec.metadata['changelog_uri'] = ''
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'http', '~> 5.2'
  spec.add_dependency 'json', '~> 2.9'
  spec.add_dependency 'uri',  '~> 1.0'
end
