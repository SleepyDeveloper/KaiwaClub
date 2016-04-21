class Meetup < ActiveRecord::Base
  has_many :meetup_attendees
  has_many :attendees, through: :meetup_attendees, source: :attendee

  scope :language, ->(language) {

  }

  def english_attendees
    lookup native_language: "English"
  end

  def japanese_attendees
    lookup native_language: "Japanese"
  end

  private
  def lookup(**options)
    attendees.where(options)
  end
end
