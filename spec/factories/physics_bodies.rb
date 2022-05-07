# frozen_string_literal: true

# == Schema Information
#
# Table name: physics_bodies
#
#  id                 :uuid             not null, primary key
#  accelerations_x    :decimal(, )      default([]), is an Array
#  accelerations_y    :decimal(, )      default([]), is an Array
#  accelerations_z    :decimal(, )      default([]), is an Array
#  forces_x           :decimal(, )      default([]), is an Array
#  forces_y           :decimal(, )      default([]), is an Array
#  forces_z           :decimal(, )      default([]), is an Array
#  initial_mass       :decimal(, )      not null
#  initial_position_x :decimal(, )      not null
#  initial_position_y :decimal(, )      not null
#  initial_position_z :decimal(, )      not null
#  initial_velocity_x :decimal(, )      not null
#  initial_velocity_y :decimal(, )      not null
#  initial_velocity_z :decimal(, )      not null
#  masses             :decimal(, )      default([]), is an Array
#  name               :text             not null
#  positions_x        :decimal(, )      default([]), is an Array
#  positions_y        :decimal(, )      default([]), is an Array
#  positions_z        :decimal(, )      default([]), is an Array
#  slug               :text
#  thrusts_x          :decimal(, )      default([]), is an Array
#  thrusts_y          :decimal(, )      default([]), is an Array
#  thrusts_z          :decimal(, )      default([]), is an Array
#  velocities_x       :decimal(, )      default([]), is an Array
#  velocities_y       :decimal(, )      default([]), is an Array
#  velocities_z       :decimal(, )      default([]), is an Array
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  universe_id        :uuid             not null
#
# Indexes
#
#  index_physics_bodies_on_name         (name) UNIQUE
#  index_physics_bodies_on_slug         (slug) UNIQUE
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
