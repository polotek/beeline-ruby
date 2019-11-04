# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rubocop/rake_task"
require "appraisal"
require "simplecov"

RSpec::Core::RakeTask.new(:spec) do |t|
  if ENV["CI"]
    t.rspec_opts = "--format progress "\
                   "--format RspecJunitFormatter "\
                   "--out rspec/rspec.xml"
  end
end

RuboCop::RakeTask.new(:rubocop)

namespace :simplecov do
  task :merge do
    results = Dir["./coverage_results/.resultset-*.json"].map do |f|
      SimpleCov::Result.from_hash(JSON.parse(File.read(f)))
    end

    SimpleCov::ResultMerger.merge_results(*results).tap do |result|
      SimpleCov::ResultMerger.store_result(result)
    end
  end
end

task test: :spec

task default: %i[rubocop test]

!ENV["APPRAISAL_INITIALIZED"] && !ENV["CI"] && task(default: :appraisal)
