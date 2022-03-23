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

  before_validation :set_missing_times

  validates_presence_of :simulation, :start_time, :end_time, :timestep, :number_of_timesteps
  validates :start_time, numericality: { greater_than_or_equal_to: 0 }
  validates :end_time, :timestep, :number_of_timesteps, numericality: { greater_than: 0 }
  validates :number_of_timesteps, numericality: { only_integer: true }
  validate :end_time_is_after_start_time, :all_times_match

  private

  def set_missing_times
    if (self.end_time.nil? and self.timestep.present? and self.number_of_timesteps.present?)
      self.end_time = (start_time + (timestep * number_of_timesteps))
    elsif (self.end_time.present? and self.timestep.nil? and self.number_of_timesteps.present?)
      self.timestep = ((self.end_time - self.start_time) / self.number_of_timesteps)
    elsif (self.end_time.present? and self.timestep.present? and self.number_of_timesteps.nil?)
      self.number_of_timesteps = ((self.end_time - self.start_time) / self.timestep).ceil
    end
  end

  def end_time_is_after_start_time
    errors.add(:end_time, "must be after start time.") if self.end_time.present? and (self.end_time <= self.start_time)
  end

  def all_times_match
    if (self.end_time.present? and self.timestep.present? and self.number_of_timesteps.present?)
      unless ((self.end_time - self.start_time) / self.number_of_timesteps == self.timestep)
        errors.add(:base, "supplied start time, end time, timestep, and number of timesteps do not match. (End time minus start time) divided by number of timesteps must equal timestep.")
      end
    end
  end
end
