require_relative 'lib/Wisconsin_parks/version'

Gem::Specification.new do |spec|
  spec.name          = "Wisconsin_parks"
  spec.version       = WisconsinParks::VERSION
  spec.authors       = ["Wardayaz"]
  spec.email         = ["wayaz107@gmail.com"]

  spec.summary       = %q{This gem allows users to see the parks in Wisconsin.}
  spec.description   = %q{This gems allows users to see the beautiful parks in Wisconsin by scraping the National Park services website.}
  spec.homepage      = "http://github.com/wayaz107/Wisconsin_parks.com"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/wayaz107/Wisconsin_parks"
  spec.metadata["changelog_uri"] = "https://github.com/wayaz107/Wisconsin_parks"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"

end
