require 'test_helper'

class ReportsControllerTest < ActionController::TestCase

  def setup
    @base_title = "KaiwaClub"
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_select "title", "Reports | #{@base_title}"
  end

end
