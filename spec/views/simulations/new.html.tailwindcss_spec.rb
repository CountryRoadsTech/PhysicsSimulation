# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'simulations/new', type: :view do
  before do
    assign(:simulation, Simulation.new(
                          name: 'MyText',
                          slug: 'MyText',
                          description: nil,
                          computation_time: '9.99'
                        ))
  end

  it 'renders new simulation form' do
    render

    assert_select 'form[action=?][method=?]', simulations_path, 'post' do
      assert_select 'textarea[name=?]', 'simulation[name]'

      assert_select 'textarea[name=?]', 'simulation[slug]'

      assert_select 'input[name=?]', 'simulation[description]'

      assert_select 'input[name=?]', 'simulation[computation_time]'
    end
  end
end
