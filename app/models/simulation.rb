# frozen_string_literal: true

# == Schema Information
#
# Table name: simulations
#
#  id               :uuid             not null, primary key
#  computation_time :decimal(, )
#  computed_at      :datetime
#  name             :text
#  slug             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Simulation < ApplicationRecord
  has_rich_text :description
end
