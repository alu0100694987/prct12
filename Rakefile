require 'bundler/gem_tasks'

$:.unshift File.dirname(__FILE__) + 'lib'
$:.unshift './lib', './spec'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

task :default => :spec

desc "Test Unitarios"
task :test do
  sh "ruby -I ./lib test/tc_matrices.rb" 
end