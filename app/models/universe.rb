# == Schema Information
#
# Table name: universes
#
#  id                  :uuid             not null, primary key
#  end_time            :decimal(, )      not null
#  number_of_timesteps :integer          not null
#  start_time          :decimal(, )      default(0.0), not null
#  timestep            :decimal(, )      not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  simulation_id       :uuid             not null
#
# Indexes
#
#  index_universes_on_simulation_id  (simulation_id)
#
# Foreign Keys
#
#  fk_rails_7ac1c0e6f8  (simulation_id => simulations.id)
#
class Universe < ApplicationRecord
  belongs_to :simulation, inverse_of: :universe
  has_many :physics_bodies, inverse_of: :universe

  validates_presence_of :simulation, :start_time, :end_time, :timestep, :number_of_timesteps
  validates :start_time, numericality: { greater_than_or_equal_to: 0 }
  validates :end_time, :timestep, :number_of_timesteps, numericality: { greater_than: 0 }
  validates :number_of_timesteps, numericality: { only_integer: true }
end
