require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    TaskManager.create({ title: "hello", description: "world"})
    assert_equal "hello", TaskManager.all.first.title
  end
end
