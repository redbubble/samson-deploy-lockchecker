require 'minitest'
require 'minitest/autorun'

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

load "#{File.dirname(__FILE__)}/../lib/samson_deploy_lockchecker/deploy_lockchecker.rb"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new
require 'mocha/mini_test'
