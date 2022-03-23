class Simulation < ApplicationRecord
  has_rich_text :description

  validates_presense_of :name
  validates_uniquness_of :name

  extend FriendlyId
  friendly_id :name, use: :history

  def should_generate_new_friendly_id?
    slug.blank? or name_changed?
  end
end
