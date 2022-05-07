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
FactoryBot.define do
  factory :simulation do
    name { 'MyText' }
    slug { 'MyText' }
    description { nil }
    computation_time { '9.99' }
    computed_at { '2022-05-07 15:49:57' }
  end
end
