json.extract! gist, :id, :description, :public, :user_id, :created_at, :updated_at
json.url gist_url(gist, format: :json)
