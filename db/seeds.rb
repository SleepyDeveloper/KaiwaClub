# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# seeding genres from seed-data/genres.yml
unless Note.count > 0
  note_seeds = Rails.root.join('db', 'seed_data', 'notes.yml')
  Note.create!(YAML::load_file(note_seeds))
end
