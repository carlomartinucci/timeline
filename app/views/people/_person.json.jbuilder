json.extract! person, :id, :name, :born_at, :dead_at, :created_at, :updated_at
json.url person_url(person, format: :json)
