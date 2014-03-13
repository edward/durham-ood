require 'rake/testtask'
require 'cucumber'
require 'cucumber/rake/task'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*_test.rb']
end

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = %w{--format progress}
end

task default: :test
