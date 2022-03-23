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
class PhysicsBody < ApplicationRecord
  belongs_to :simulation, inverse_of: :physics_bodies

  has_rich_text :description

  after_create :initialize_state_arrays

  validates_presence_of :name, :initial_position_x, :initial_position_y, :initial_position_z, :initial_velocity_x, :initial_velocity_y, :initial_velocity_z, :initial_mass
  validates_uniqueness_of :name

  extend FriendlyId
  friendly_id :name, use: :history

  def should_generate_new_friendly_id?
    slug.blank? or name_changed?
  end

  def positions
    l = self.universe.number_of_timesteps
    positions_array = Array.new(l, nil)

    l.times do |t|
      positions_array[t] = [self.positions_x[t], self.positions_y[t], self.positions_z[t]]
    end

    positions_array
  end

  def velocities
    l = self.universe.number_of_timesteps
    velocities_array = Array.new(l, nil)

    l.times do |t|
      velocities_array[t] = [self.velocities_x[t], self.velocities_y[t], self.velocities_z[t]]
    end

    velocities_array
  end

  def accelerations
    l = self.universe.number_of_timesteps
    accelerations_array = Array.new(l, nil)

    l.times do |t|
      accelerations_array[t] = [self.accelerations_x[t], self.accelerations_y[t], self.accelerations_z[t]]
    end

    accelerations_array
  end

  def forces
    l = self.universe.number_of_timesteps
    forces_array = Array.new(l, nil)

    l.times do |t|
      forces_array[t] = [self.forces_x[t], self.forces_y[t], self.forces_z[t]]
    end

    forces_array
  end

  def thrusts
    l = self.universe.number_of_timesteps
    thrusts_array = Array.new(l, nil)

    l.times do |t|
      thrusts_array[t] = [self.thrusts_x[t], self.thrusts_y[t], self.thrusts_z[t]]
    end

    thrusts_array
  end

  private

  # Initialize the state arrays with the correct length.
  def initialize_state_arrays
    l = self.simulation.universe.number_of_timesteps

    self.positions_x = Array.new(l, nil)
    self.positions_y = Array.new(l, nil)
    self.positions_z = Array.new(l, nil)
    self.velocities_x = Array.new(l, nil)
    self.velocities_y = Array.new(l, nil)
    self.velocities_z = Array.new(l, nil)
    self.accelerations_x = Array.new(l, nil)
    self.accelerations_y = Array.new(l, nil)
    self.accelerations_z = Array.new(l, nil)
    self.forces_x = Array.new(l, nil)
    self.forces_y = Array.new(l, nil)
    self.forces_z = Array.new(l, nil)
    self.thrusts_x = Array.new(l, nil)
    self.thrusts_y = Array.new(l, nil)
    self.thrusts_z = Array.new(l, nil)
    self.masses = Array.new(l, nil)
  end
end
