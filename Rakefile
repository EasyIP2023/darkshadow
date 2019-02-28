require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'lucurious/version'

RSpec::Core::RakeTask.new(:spec)

task :push do
  sh "gem push pkg/darkshadow-#{Lucurious::VERSION}.gem"
end

task :yank, [:version] do |task, args|
  sh "gem yank darkshadow -v #{arg[:version]}"
end

task default: [:build, :install, :spec]
