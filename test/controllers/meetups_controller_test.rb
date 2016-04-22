require 'test_helper'

class MeetupsControllerTest < ActionController::TestCase
  
  test "the index page" do
    get :index
    assert_response :success
    assert_select "title", "Meetups | KaiwaClub"
  end

end
