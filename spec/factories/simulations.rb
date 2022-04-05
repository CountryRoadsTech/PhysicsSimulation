# == Schema Information
#
# Table name: simulations
#
#  id               :uuid             not null, primary key
#  computation_time :decimal(8, 5)
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
FactoryBot.define do
  factory :simulation do
    name { "MyText" }
    slug { "MyText" }
    description { nil }
    computation_time { "9.99" }
    computed_at { "2022-03-23 13:47:40" }
  end
end
