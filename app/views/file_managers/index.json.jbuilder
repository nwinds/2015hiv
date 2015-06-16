json.array!(@file_managers) do |file_manager|
  json.extract! file_manager, :id, :file_avatar
  json.url file_manager_url(file_manager, format: :json)
end
