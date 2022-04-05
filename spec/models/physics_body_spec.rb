# == Schema Information
#
# Table name: physics_bodies
#
#  id                 :uuid             not null, primary key
#  accelerations_x    :decimal(8, 5)    default([]), is an Array
#  accelerations_y    :decimal(8, 5)    default([]), is an Array
#  accelerations_z    :decimal(8, 5)    default([]), is an Array
#  forces_x           :decimal(8, 5)    default([]), is an Array
#  forces_y           :decimal(8, 5)    default([]), is an Array
#  forces_z           :decimal(8, 5)    default([]), is an Array
#  initial_mass       :decimal(8, 5)    not null
#  initial_position_x :decimal(8, 5)    not null
#  initial_position_y :decimal(8, 5)    not null
#  initial_position_z :decimal(8, 5)    not null
#  initial_velocity_x :decimal(8, 5)    not null
#  initial_velocity_y :decimal(8, 5)    not null
#  initial_velocity_z :decimal(8, 5)    not null
#  masses             :decimal(8, 5)    default([]), is an Array
#  name               :text             not null
#  positions_x        :decimal(8, 5)    default([]), is an Array
#  positions_y        :decimal(8, 5)    default([]), is an Array
#  positions_z        :decimal(8, 5)    default([]), is an Array
#  slug               :text
#  thrusts_x          :decimal(8, 5)    default([]), is an Array
#  thrusts_y          :decimal(8, 5)    default([]), is an Array
#  thrusts_z          :decimal(8, 5)    default([]), is an Array
#  velocities_x       :decimal(8, 5)    default([]), is an Array
#  velocities_y       :decimal(8, 5)    default([]), is an Array
#  velocities_z       :decimal(8, 5)    default([]), is an Array
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  simulation_id      :uuid             not null
#
# Indexes
#
#  index_physics_bodies_on_name           (name) UNIQUE
#  index_physics_bodies_on_simulation_id  (simulation_id)
#  index_physics_bodies_on_slug           (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_0453254253  (simulation_id => simulations.id)
#
require 'rails_helper'

RSpec.describe PhysicsBody, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
