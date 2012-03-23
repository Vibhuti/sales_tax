require 'rspec'
require 'rspec/core/rake_task'

RSpec.configure {|c| c.fail_fast = true}

task :default => :spec

desc "run tests for this problem"
RSpec::Core::RakeTask.new do |task|
  lab = "."
  task.pattern = "#{lab}/*_spec.rb"
  task.rspec_opts = [ "-I#{lab}", '-f documentation', '--color']
  task.verbose = false
end