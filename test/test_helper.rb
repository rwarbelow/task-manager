ENV["TASK_MANAGER_ENV"] = "test"

require 'bundler'
Bundler.require
require 'minitest/autorun'
require 'minitest/pride'
$:.unshift File.expand_path("../../app", __FILE__)
require 'models/base'

module Minitest
  class Test
    def teardown
      TaskManager.all.clear
    end
  end
end
