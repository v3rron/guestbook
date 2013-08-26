json.array!(@guests) do |guest|
    json.extract! guest, :id, :designation, :name, :email, :phone, :event_id, :created_at, :updated_at
    json.url guest_url(guest, format: :json)
end