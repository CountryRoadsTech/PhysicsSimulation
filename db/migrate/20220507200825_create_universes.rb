# frozen_string_literal: true

class CreateUniverses < ActiveRecord::Migration[7.0]
  def change
    create_table :universes, id: :uuid do |t|
      t.belongs_to :simulation, null: false, foreign_key: true, type: :uuid
      t.decimal :start_time
      t.decimal :end_time
      t.decimal :timestep
      t.integer :number_of_timesteps

      t.timestamps
    end
  end
end
