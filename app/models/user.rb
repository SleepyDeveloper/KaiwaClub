class User < ActiveRecord::Base
  has_many :meetup_attendees
  has_many :meetups, through: :meetup_attendees, source: :meetup

  validates :name, presence: true
  validates :native_language, presence: true
end
