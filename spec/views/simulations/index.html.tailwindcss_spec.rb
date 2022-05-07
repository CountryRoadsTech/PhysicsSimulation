# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'simulations/index', type: :view do
  before do
    assign(:simulations, [
             Simulation.create!(
               name: 'MyText',
               slug: 'MyText',
               description: nil,
               computation_time: '9.99'
             ),
             Simulation.create!(
               name: 'MyText',
               slug: 'MyText',
               description: nil,
               computation_time: '9.99'
             )
           ])
  end

  it 'renders a list of simulations' do
    render
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
  end
end
