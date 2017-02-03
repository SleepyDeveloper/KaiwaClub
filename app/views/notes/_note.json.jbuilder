json.extract! note, :id, :title, :text, :date, :slug, :created_at, :updated_at
json.url note_url(note, format: :json)