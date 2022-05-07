# frozen_string_literal: true

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
class Simulation < ApplicationRecord
  has_rich_text :description
  has_one :universe, inverse_of: :simulation, dependent: :destroy
  has_many :physics_bodies, dependent: :destroy

  accepts_nested_attributes_for :universe
  accepts_nested_attributes_for :physics_bodies, allow_destroy: true, reject_if: proc { |attr| attr['name'].blank? }

  validates :name, presence: true
  validates :name, uniqueness: true

  extend FriendlyId
  friendly_id :name, use: :history

  def should_generate_new_friendly_id?
    slug.blank? or name_changed?
  end
end
