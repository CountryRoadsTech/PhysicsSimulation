# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'simulations/edit', type: :view do
  before do
    @simulation = assign(:simulation, Simulation.create!(
                                        name: 'MyText',
                                        slug: 'MyText',
                                        description: nil,
                                        computation_time: '9.99'
                                      ))
  end

  it 'renders the edit simulation form' do
    render

    assert_select 'form[action=?][method=?]', simulation_path(@simulation), 'post' do
      assert_select 'textarea[name=?]', 'simulation[name]'

      assert_select 'textarea[name=?]', 'simulation[slug]'

      assert_select 'input[name=?]', 'simulation[description]'

      assert_select 'input[name=?]', 'simulation[computation_time]'
    end
  end
end
