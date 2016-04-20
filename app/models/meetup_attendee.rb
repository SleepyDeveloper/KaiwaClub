class MeetupAttendee < ActiveRecord::Base
  belongs_to :meetup
  belongs_to :attendee, foreign_key: :user_id, class_name: :User
end
