class CreatePhysicsBodies < ActiveRecord::Migration[7.0]
  def change
    precision = Rails.configuration.numeric_precision
    scale = Rails.configuration.numeric_scale

    create_table :physics_bodies, id: :uuid do |t|
      t.belongs_to :simulation, null: false, foreign_key: true, type: :uuid

      t.text :name, null: false
      t.text :slug

      t.decimal :initial_position_x, precision: precision, scale: scale, null: false
      t.decimal :initial_position_y, precision: precision, scale: scale, null: false
      t.decimal :initial_position_z, precision: precision, scale: scale, null: false
      t.decimal :initial_velocity_x, precision: precision, scale: scale, null: false
      t.decimal :initial_velocity_y, precision: precision, scale: scale, null: false
      t.decimal :initial_velocity_z, precision: precision, scale: scale, null: false
      t.decimal :initial_mass, precision: precision, scale: scale, null: false

      t.decimal :positions_x, array: true, precision: precision, scale: scale, default: []
      t.decimal :positions_y, array: true, precision: precision, scale: scale, default: []
      t.decimal :positions_z, array: true, precision: precision, scale: scale, default: []
      t.decimal :velocities_x, array: true, precision: precision, scale: scale, default: []
      t.decimal :velocities_y, array: true, precision: precision, scale: scale, default: []
      t.decimal :velocities_z, array: true, precision: precision, scale: scale, default: []
      t.decimal :accelerations_x, array: true, precision: precision, scale: scale, default: []
      t.decimal :accelerations_y, array: true, precision: precision, scale: scale, default: []
      t.decimal :accelerations_z, array: true, precision: precision, scale: scale, default: []
      t.decimal :forces_x, array: true, precision: precision, scale: scale, default: []
      t.decimal :forces_y, array: true, precision: precision, scale: scale, default: []
      t.decimal :forces_z, array: true, precision: precision, scale: scale, default: []
      t.decimal :thrusts_x, array: true, precision: precision, scale: scale, default: []
      t.decimal :thrusts_y, array: true, precision: precision, scale: scale, default: []
      t.decimal :thrusts_z, array: true, precision: precision, scale: scale, default: []
      t.decimal :masses, array: true, precision: precision, scale: scale, default: []

      t.timestamps
    end

    add_index :physics_bodies, :name, unique: true
    add_index :physics_bodies, :slug, unique: true
  end
end
