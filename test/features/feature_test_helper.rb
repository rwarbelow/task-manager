require 'sinatra'
require 'capybara'

require_relative "../test_helper"
require 'controllers/task_manager_app'

Capybara.app = TaskManagerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
