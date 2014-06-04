json.array!(@projects) do |project|
  json.extract! project, :id, :name, :width, :height, :type, :fabric_type, :fabric_count, :fabric_colour, :thread_type
  json.url project_url(project, format: :json)
end
