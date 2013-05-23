require 'rubygems'
require 'bundler'
require 'rake'
require 'rake/testtask'
require 'rubygems/package_task'
require 'rdoc/task'

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

RDoc::Task.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "leap-motion #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :compile do
  chdir 'ext' do
    ruby 'extconf.rb'
    sh   'make'
  end
end

Bundler::GemHelper.install_tasks
