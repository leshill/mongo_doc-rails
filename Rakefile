require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "mongo_doc-rails"
    gem.summary = "Rails 3 integration for MongoDoc"
    gem.description = "MongoDoc-Rails provides an interface between the MongoDoc::Document and the Rails 3 ActionPack."
    gem.email = "elliot.cm@gmail.com, leshill@gmail.com"
    gem.homepage = "http://github.com/elliotcm/mongo_doc-rails"
    gem.authors = ["Elliot Crosby-McCullough, Les Hill"]
    gem.add_dependency "mongo_doc", ">=0.4.3"
    gem.add_development_dependency "rspec", "= 1.3.0"
  end
  Jeweler::GemcutterTasks.new

  task :spec => :check_dependencies
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.spec_opts = ['--options', "#{File.expand_path(File.dirname(__FILE__))}/spec/spec.opts"]
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.spec_opts = ['--options', "#{File.expand_path(File.dirname(__FILE__))}/spec/spec.opts"]
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec
