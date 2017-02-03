class Note < ActiveRecord::Base
  extend FriendlyId

  validates :date, presence: true
  validates :text, presence: true

  friendly_id :date, use: :slugged

  before_save {
    self.text = self.text.gsub(/\r\n/, "\n") unless self.text.nil?
  }

  def note_text(format = :default)
    case format
    when :html
      blue_cloth.to_html.gsub(/<table/,"<table class=\"table table-striped\" ")
    else
      text
    end
  end

  private

  def blue_cloth
    @blue_cloth ||= BlueCloth.new(text, tables: true)
  end

end
