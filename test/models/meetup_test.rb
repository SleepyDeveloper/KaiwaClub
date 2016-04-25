require 'test_helper'

class MeetupTest < ActiveSupport::TestCase
  def setup
    @meetup = Meetup.new(date: Date.today)
  end

  test "should be valid" do
    @meetup.valid?
  end
end
