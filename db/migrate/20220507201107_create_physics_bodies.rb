# frozen_string_literal: true

class CreatePhysicsBodies < ActiveRecord::Migration[7.0]
  def change
    create_table :physics_bodies, id: :uuid do |t|
      t.belongs_to :universe, null: false, foreign_key: true, type: :uuid
      t.text :name
      t.text :slug
      t.decimal :initial_position_x
      t.decimal :initial_position_y
      t.decimal :initial_position_z
      t.decimal :initial_velocity_x
      t.decimal :initial_velocity_y
      t.decimal :initial_velocity_z
      t.decimal :initial_mass
      t.decimal :positions_x
      t.decimal :positions_y
      t.decimal :positions_z
      t.decimal :velocities_x
      t.decimal :velocities_y
      t.decimal :velocities_z
      t.decimal :accelerations_x
      t.decimal :accelerations_y
      t.decimal :accelerations_z
      t.decimal :forces_x
      t.decimal :forces_y
      t.decimal :forces_z
      t.decimal :thrusts_x
      t.decimal :thrusts_y
      t.decimal :thrusts_z
      t.decimal :masses

      t.timestamps
    end
  end
end
