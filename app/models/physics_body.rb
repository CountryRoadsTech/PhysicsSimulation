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
class PhysicsBody < ApplicationRecord
  belongs_to :universe, inverse_of: :physics_bodies
  
  has_rich_text :description

  validates_presence_of :name, :initial_position_x, :initial_position_y, :initial_position_z, :initial_velocity_x, :initial_velocity_y, :initial_velocity_z, :initial_mass
  validates_uniqueness_of :name

  extend FriendlyId
  friendly_id :name, use: :history

  def should_generate_new_friendly_id?
    slug.blank? or name_changed?
  end
end
