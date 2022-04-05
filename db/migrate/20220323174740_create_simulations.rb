class CreateSimulations < ActiveRecord::Migration[7.0]
  def change
    precision = Rails.configuration.numeric_precision
    scale = Rails.configuration.numeric_scale

    create_table :simulations, id: :uuid do |t|
      t.text :name, null: false
      t.text :slug
      t.decimal :computation_time, precision: precision, scale: scale

      t.datetime :computed_at
      t.timestamps
    end

    add_index :simulations, :name, unique: true
    add_index :simulations, :slug, unique: true
  end
end
