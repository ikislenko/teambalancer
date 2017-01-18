require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should balanced tasks" do
    get rebalance_url
    assert_equal(1, User.first.tasks.count)
  end

  test "should clear balanced tasks" do
    get clear_url
    assert_equal(0, User.first.tasks.count)
  end
end
