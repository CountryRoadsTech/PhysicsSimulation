class CreateUniverses < ActiveRecord::Migration[7.0]
  def change
    precision = Rails.configuration.numeric_precision
    scale = Rails.configuration.numeric_scale

    create_table :universes, id: :uuid do |t|
      t.belongs_to :simulation, null: false, foreign_key: true, type: :uuid

      t.decimal :start_time, default: 0.0, precision: precision, scale: scale, null: false
      t.decimal :end_time, precision: precision, scale: scale, null: false
      t.decimal :timestep, precision: precision, scale: scale, null: false
      t.integer :number_of_timesteps, null: false
      t.decimal :timesteps, array: true, precision: precision, scale: scale, default: []

      t.timestamps
    end
  end
end
