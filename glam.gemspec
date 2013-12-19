Gem::Specification.new do |spec|
  spec.name          = "glam"
  spec.version       = "0.0.1"
  spec.authors       = ["Paul Barry"]
  spec.email         = ["mail@paulbarry.com"]
  spec.description   = %q{An HTML pretty printer}
  spec.summary       = %q{Make your HTML look glamorous!}
  spec.homepage      = "http://github.com/pjb3/glam"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "nokogiri"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
