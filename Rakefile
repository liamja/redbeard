require 'rspec/core'
require 'rspec/core/rake_task'
require 'bundler/gem_tasks'
 
desc "Run all specs in spec directory (excluding plugin specs)"
RSpec::Core::RakeTask.new(:spec)

task :default => :spec
task :test => :spec
