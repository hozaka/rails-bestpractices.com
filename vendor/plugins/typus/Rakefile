require 'rubygems'
require 'rake/testtask'
require 'rake/rdoctask'

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "typus/version"

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the typus plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate plugin documentation.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Typus'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

##
# Build and release.
##

task :build do
  system "gem build typus.gemspec"
end

task :release => :build do
  version = Typus::VERSION
  system "git tag v#{version}"
  system "git push origin v#{version}"
  system "gem push pkg/typus-#{version}.gem"
  system "git clean -fd"
  system "gem push typus-#{version}"
end

##
# Docs
##

namespace :site do

  desc "Regenerate the documentation"
  task :build do
    command = `which asciidoci`.strip
    puts "AsciiDoc is not installed."; exit if command.empty?
    puts "Building site using `asciidoc`."
    system "cd doc && #{command.strip} -a icons -a toc -o site/index.html 000-index.txt"
  end

  desc "Update the website"
  task :deploy => :build do
    Dir.chdir("doc/site") do
      sh %(scp -r ./ fesplugas@labs.intraducibles.com:~/public_html/labs.intraducibles.com/current/public/projects/typus/documentation/3-0-unstable)
    end
  end

end
