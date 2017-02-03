class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :text
      t.date :date
      t.string :slug

      t.timestamps null: false
    end
    add_index :notes, :slug, unique: true
  end
end
