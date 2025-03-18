# frozen_string_literal: true

require_relative "lib/zoho_zeptomail/ruby/version"

Gem::Specification.new do |spec|
  spec.name = "zoho_zeptomail-ruby"
  spec.version = ZohoZeptomail::Ruby::VERSION
  spec.authors =['ZohoMail']
  spec.email = ['zmintegration@zohomail.com']

  spec.summary ="Zoho ZeptoMail official Ruby SDK"
  spec.description = "Zoho ZeptoMail official Ruby SDK. Interacts with all endpoints at Zoho ZeptoMail API."
  spec.homepage = "https://www.zoho.com/zeptomail/"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = 'https://rubygems.org'

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/zohomail/zoho_zeptomail-ruby/tree/main/zoho_zeptomail-ruby-main"
  spec.metadata["changelog_uri"] = "https://github.com/zohomail/zoho_zeptomail-ruby/blob/main/zoho_zeptomail-ruby-main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
