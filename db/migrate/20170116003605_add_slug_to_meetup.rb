class AddSlugToMeetup < ActiveRecord::Migration
  def change
    add_column :meetups, :slug, :string
    add_index :meetups, :slug, unique: true
  end
end
