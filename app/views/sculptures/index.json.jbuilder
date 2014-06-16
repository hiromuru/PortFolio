json.array!(@sculptures) do |sculpture|
  json.extract! sculpture, :id
  json.url sculpture_url(sculpture, format: :json)
end
