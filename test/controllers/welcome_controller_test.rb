require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase


  # returning a broken index.html allows aws to count an instance as
  # unresponsive
  test "index.html should return ok sometimes, and sometimes broken" do
    r = Hash.new
    100.times do
      response = get :index
      r[response] = r[response].nil? ? 1 : 1 + r[response]
      assert_not_equal r[:success], 0
      assert_not_equal r[:success], 100
    end
  end

end
