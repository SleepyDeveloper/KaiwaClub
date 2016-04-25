require 'test_helper'

class MeetupsControllerTest < ActionController::TestCase
  def setup
    @base_title = "KaiwaClub"
  end

  test "the index page" do
    get :index
    assert_response :success
    assert_select "title", "Meetups | #{@base_title}"
  end

end
