class MeetupAttendee < ActiveRecord::Base
  belongs_to :meetup
  belongs_to :attendee, foreign_key: :user_id, class_name: :User

  # do not allows nil attendees or meetups in the table
  validates :attendee, presence: true
  validates :meetup, presence: true

end
