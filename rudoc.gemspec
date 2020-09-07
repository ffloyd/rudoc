require_relative 'lib/rudoc/version'

Gem::Specification.new do |spec|
  spec.name          = "rudoc"
  spec.version       = Rudoc::VERSION
  spec.authors       = ["Roman Kolesnev"]
  spec.email         = ["rvkolesnev@gmail.com"]

  spec.summary       = %q{Rudoc - simple to use and extendable Ruby documentation system}
  spec.homepage      = "https://github.com/ffloyd/rudoc"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ffloyd/rudoc"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
