 lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'master_league/version'

Gem::Specification.new do |spec|
  spec.name          = 'master_league'
  spec.version       = MasterLeague::VERSION
  spec.authors       = ['Tobias Bühlmann']
  spec.email         = ['tobias@xn--bhlmann-n2a.de']

  spec.summary       = 'Client to consume the Master League API'
  spec.description   = 'This Gem serves as a client for the Master League API'
  spec.homepage      = 'https://github.com/tbuehlmann/master_league'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(/^exe/) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'http'
  spec.add_dependency 'virtus'
end
