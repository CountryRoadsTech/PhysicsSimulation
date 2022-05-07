# frozen_string_literal: true

# Creates the universes database table with all neccessary columns and constraints.
class CreateUniverses < ActiveRecord::Migration[7.0]
  def change
    create_table :universes, id: :uuid do |t|
      t.belongs_to :simulation, null: false, foreign_key: true, type: :uuid

      t.decimal :start_time, null: false
      t.decimal :end_time, null: false
      t.decimal :timestep, null: false
      t.integer :number_of_timesteps, null: false
      t.decimal :timesteps, array: true, default: []

      t.timestamps
    end
  end
end
