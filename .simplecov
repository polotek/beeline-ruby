require "simplecov-console"

SimpleCov.formatter = SimpleCov::Formatter::Console

# Make coverage work with Appraisals
SimpleCov.command_name(ENV["BUNDLE_GEMFILE"].split.last || "")

SimpleCov.start do
  add_filter "/spec/"
  add_filter "/vendor/"
end
