json.array!(@guests) do |guest|
  json.extract! guest, :name, :email, :phone, :designation
  json.url guest_url(guest, format: :json)
end
