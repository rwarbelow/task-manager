require_relative "feature_test_helper"

class UserCreatesATask < FeatureTest
  def test_user_sees_all_tasks
    visit '/tasks'
    assert page.has_content?('Tasks')
  end
end
