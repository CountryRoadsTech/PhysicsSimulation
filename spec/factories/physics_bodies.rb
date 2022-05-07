# frozen_string_literal: true

# == Schema Information
#
# Table name: physics_bodies
#
#  id                 :uuid             not null, primary key
#  accelerations_x    :decimal(, )
#  accelerations_y    :decimal(, )
#  accelerations_z    :decimal(, )
#  forces_x           :decimal(, )
#  forces_y           :decimal(, )
#  forces_z           :decimal(, )
#  initial_mass       :decimal(, )
#  initial_position_x :decimal(, )
#  initial_position_y :decimal(, )
#  initial_position_z :decimal(, )
#  initial_velocity_x :decimal(, )
#  initial_velocity_y :decimal(, )
#  initial_velocity_z :decimal(, )
#  masses             :decimal(, )
#  name               :text
#  positions_x        :decimal(, )
#  positions_y        :decimal(, )
#  positions_z        :decimal(, )
#  slug               :text
#  thrusts_x          :decimal(, )
#  thrusts_y          :decimal(, )
#  thrusts_z          :decimal(, )
#  velocities_x       :decimal(, )
#  velocities_y       :decimal(, )
#  velocities_z       :decimal(, )
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  universe_id        :uuid             not null
#
# Indexes
#
#  index_physics_bodies_on_universe_id  (universe_id)
#
# Foreign Keys
#
#  fk_rails_da7d4a33b1  (universe_id => universes.id)
#
FactoryBot.define do
  factory :physics_body do
    universe { nil }
    name { 'MyText' }
    slug { 'MyText' }
    description { nil }
    initial_position_x { '9.99' }
    initial_position_y { '9.99' }
    initial_position_z { '9.99' }
    initial_velocity_x { '9.99' }
    initial_velocity_y { '9.99' }
    initial_velocity_z { '9.99' }
    initial_mass { '9.99' }
    positions_x { '9.99' }
    positions_y { '9.99' }
    positions_z { '9.99' }
    velocities_x { '9.99' }
    velocities_y { '9.99' }
    velocities_z { '9.99' }
    accelerations_x { '9.99' }
    accelerations_y { '9.99' }
    accelerations_z { '9.99' }
    forces_x { '9.99' }
    forces_y { '9.99' }
    forces_z { '9.99' }
    thrusts_x { '9.99' }
    thrusts_y { '9.99' }
    thrusts_z { '9.99' }
    masses { '9.99' }
  end
end
