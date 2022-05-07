# frozen_string_literal: true

class CreateSimulations < ActiveRecord::Migration[7.0]
  def change
    create_table :simulations, id: :uuid do |t|
      t.text :name
      t.text :slug
      t.decimal :computation_time
      t.datetime :computed_at

      t.timestamps
    end
  end
end
