json.extract! comment, :id, :circle_id, :name, :message, :created_at, :updated_at
json.url comment_url(comment, format: :json)