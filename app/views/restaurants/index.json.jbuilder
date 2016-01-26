json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :last_visit
  json.url restaurant_url(restaurant, format: :json)
end
