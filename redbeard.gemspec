Gem::Specification.new do |s|
  s.name                = "redbeard"
  s.version             = "0.0.0"
  s.date                = "2013-07-27"
  s.default_executable  = "redbeard"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Liam Anderson"]
  s.description = %q{A BitTorrent tracker.}
  s.email = %q{liam.anderson.91@gmail.com}
  s.homepage  = %q{http://rubygems.org/gems/redbeard}
  
  s.files = ["Rakefile", "lib/redbeard.rb", "bin/redbeard"]
  s.test_files  = ["spec/redbeard_spec.rb"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{redbeard!}

  s.add_runtime_dependency "sinatra"
  
  s.add_development_dependency "rack-test"
  s.add_development_dependency "rspec"
  s.add_development_dependency "ZenTest"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

