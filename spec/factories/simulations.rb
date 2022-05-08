# frozen_string_literal: true

require 'faker'

# == Schema Information
#
# Table name: simulations
#
#  id               :uuid             not null, primary key
#  computation_time :decimal(, )
#  computed_at      :datetime
#  name             :text             not null
#  slug             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_simulations_on_name  (name) UNIQUE
#  index_simulations_on_slug  (slug) UNIQUE
#
FactoryBot.define do
  factory :simulation do
    name { "#{Faker::Science.unique.scientist}s Simulation" }
    description { Faker::Lorem.paragraph }

    after :create do |simulation|
      create :universe, simulation: simulation
    end
  end
end
