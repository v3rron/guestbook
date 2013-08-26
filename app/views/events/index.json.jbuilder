json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :created_at, :updated_at, :guests
  json.url event_url(event)
  json.url_json event_url(event, format: :json)
end
