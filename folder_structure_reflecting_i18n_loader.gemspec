# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'folder_structure_reflecting_i18n_loader/version'

Gem::Specification.new do |spec|
  spec.name          = "folder_structure_reflecting_i18n_loader"
  spec.version       = FolderStructureReflectingI18nLoader::VERSION
  spec.authors       = ["Andrey Titov"]
  spec.email         = ["terracote@gmail.com"]
  spec.summary       = %q{Generates I18n key tree basing on folder structure, so you can put your translations beside you rails views}
  spec.description   = %q{Example:
  music/t.artists/en.yml: 
  #####
  best: Chris Clark

  ######
  I18n.locale = :en
  I18n.t 'music.artists.best' #=> "Chris Clark"
  }
  spec.homepage      = "http://github.com/idrozd/folder_structure_reflecting_i18n_loader"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'i18n'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
