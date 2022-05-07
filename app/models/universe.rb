# frozen_string_literal: true

# == Schema Information
#
# Table name: universes
#
#  id                  :uuid             not null, primary key
#  end_time            :decimal(, )
#  number_of_timesteps :integer
#  start_time          :decimal(, )
#  timestep            :decimal(, )
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
  belongs_to :simulation
end
