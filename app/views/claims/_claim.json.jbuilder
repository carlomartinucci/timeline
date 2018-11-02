json.extract! claim, :id, :title, :body, :person_id, :claimed_at, :happened_at, :created_at, :updated_at
json.url claim_url(claim, format: :json)
