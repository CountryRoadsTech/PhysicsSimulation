json.extract! physics_body, :id, :universe_id, :name, :slug, :description, :initial_position_x, :initial_position_y, :initial_position_z, :initial_velocity_x, :initial_velocity_y, :initial_velocity_z, :initial_mass, :positions_x, :positions_y, :positions_z, :velocities_x, :velocities_y, :velocities_z, :accelerations_x, :accelerations_y, :accelerations_z, :forces_x, :forces_y, :forces_z, :thrusts_x, :thrusts_y, :thrusts_z, :masses, :created_at, :updated_at
json.url physics_body_url(physics_body, format: :json)
json.description physics_body.description.to_s
