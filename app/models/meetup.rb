class Meetup < ActiveRecord::Base

  # https://robots.thoughtbot.com/accepts-nested-attributes-for-with-has-many-through
  has_many :meetup_attendees, inverse_of: :meetup
  has_many :attendees, through: :meetup_attendees, source: :attendee

  accepts_nested_attributes_for :meetup_attendees

  # TODO: should we use scopes? to privde the ability to look up any language
  # after leading the meetup for almost a year, it's pretty clear that the
  # attendees are an international crowd and it's not either Japanese or English
  # for native language. It would be advisable to create a column called,
  # native_japanese and make it a boolean. When they enter their name and language,
  # if they enter anything but Japanese it will mark native_japanese to false.

  # scope :language, ->(language) {
  #   where(native_language: language)
  # }

  def non_japanese_attendees
    attendees.where.not(native_language: 'Japanese')
  end

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
