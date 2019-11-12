require 'bundler/gem_tasks'
require 'rake/testtask'
require 'darkshadow/version'

task :yank, [:version] do |task, args|
  sh "gem yank darkshadow -v #{arg[:version]}"
end

task default: [:build, :install]
