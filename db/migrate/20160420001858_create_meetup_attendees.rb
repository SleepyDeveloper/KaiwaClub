class CreateMeetupAttendees < ActiveRecord::Migration
  def change
    create_table :meetup_attendees do |t|
      t.references :meetup, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :meetup_attendees, :meetups
    add_foreign_key :meetup_attendees, :users
  end
end
