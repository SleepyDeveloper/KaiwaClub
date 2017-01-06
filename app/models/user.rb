class User < ActiveRecord::Base
  has_many :meetup_attendees, dependent: :destroy
  has_many :meetups, through: :meetup_attendees, source: :meetup

  # don't allow creation of new users without an email address.
  validates :name, presence: true
  validates :email, presence: true
  validates :native_language, presence: true
end
