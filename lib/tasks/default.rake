require 'jslint/tasks'

Rake::Task[:default].clear

desc "First run model specs with coverage, then all specs, then jslint and finally all other metrics"
task :default => ["coverage:models", "spec", "jslint", "metrics:all"]

namespace :coverage do
  desc "Run model specs with coverage"
  task :models do
    ENV["COVERAGE"] = "true"
    Rake::Task["spec:models"].invoke
    ENV["COVERAGE"] = "false"
  end
end