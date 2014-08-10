json.array!(@ideas) do |idea|
  json.extract! idea, :id, :title, :description, :order, :is_deleted
  json.url idea_url(idea, format: :json)
end
