require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template "meetups/index"
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", meetups_path
    assert_select "a[href=?]", reports_path
  end
end
