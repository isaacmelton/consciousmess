json.array!(@ripples) do |ripple|
  json.extract! ripple, :id, :name, :website, :message
  json.url ripple_url(ripple, format: :json)
end
