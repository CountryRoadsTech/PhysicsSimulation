json.extract! simulation, :id, :name, :slug, :description, :computation_time, :computed_at, :created_at, :updated_at
json.url simulation_url(simulation, format: :json)
json.description simulation.description.to_s
