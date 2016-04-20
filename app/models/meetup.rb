class Meetup < ActiveRecord::Base
  has_many :meetup_attendees
  has_many :attendees, through: :meetup_attendees, source: :attendee
end
