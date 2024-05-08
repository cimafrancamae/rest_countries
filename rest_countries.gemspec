# frozen_string_literal: true

require_relative "lib/rest_countries/version"

Gem::Specification.new do |spec|
  spec.name = "rest_countries"
  spec.version = RestCountries::VERSION
  spec.authors = ["Mae Ann Sacedon Cimafranca"]
  spec.email = ["cimafrancamae@gmail.com"]

  spec.summary = "Rest Countries API Ruby Client"
  spec.description = "Get information about countries via a RESTful API. Current version: 3.1. You can access API through https://restcountries.com/v3.1/all but in order to get a faster response, you should filter the results by the fields you need."
  spec.homepage = "https://github.com/cimafrancamae/rest_countries"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/cimafrancamae/rest_countries"
  spec.metadata["changelog_uri"] = "https://github.com/cimafrancamae/rest_countries/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "faraday", "~> 1.7"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
