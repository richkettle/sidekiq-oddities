json.array!(@foos) do |foo|
  json.extract! foo, :id, :title, :name, :body
  json.url foo_url(foo, format: :json)
end
