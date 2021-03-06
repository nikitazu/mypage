json.array!(@works) do |work|
  json.extract! work, :id, :title, :description, :url, :released, :is_deleted
  json.url work_url(work, format: :json)
end
