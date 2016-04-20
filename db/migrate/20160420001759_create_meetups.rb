class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end
