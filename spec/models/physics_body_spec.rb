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
require 'rails_helper'

RSpec.describe PhysicsBody, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
