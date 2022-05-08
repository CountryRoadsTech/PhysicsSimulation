# frozen_string_literal: true

require 'faker'

# == Schema Information
#
# Table name: universes
#
#  id                  :uuid             not null, primary key
#  end_time            :decimal(, )      not null
#  number_of_timesteps :integer          not null
#  start_time          :decimal(, )      not null
#  timestep            :decimal(, )      not null
#  timesteps           :decimal(, )      default([]), is an Array
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
FactoryBot.define do
  factory :universe do
    simulation
    start_time { Faker::Number.positive }
    end_time { Faker::Number.between(from: start_time + 1, to: start_time + 1000) }
    number_of_timesteps { Faker::Number.between(from: 10, to: 100) }
  end
end
