# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rubocop/rake_task"
require "appraisal"

RSpec::Core::RakeTask.new(:spec) do |t|
  if ENV["CIRCLECI"]
    t.rspec_opts = "--format progress "\
    "--format RspecJunitFormatter "\
    "--out test-results/rspec/results.xml"
  end
end

RuboCop::RakeTask.new(:rubocop)

task test: :spec

task default: %i[rubocop test]

!ENV["APPRAISAL_INITIALIZED"] && !ENV["CIRCLECI"] && task(default: :appraisal)
