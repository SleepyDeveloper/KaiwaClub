class User < ActiveRecord::Base
  has_many :meetup_attendees
  has_many :meetups, through: :meetup_attendees, source: :meetup
end
