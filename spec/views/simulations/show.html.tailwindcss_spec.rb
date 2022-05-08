# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'simulations/show', type: :view do
  before do
    @simulation = assign(:simulation, create(:simulation))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to include(@simulation.name)
    expect(rendered).to include(@simulation.description.to_s)
    expect(rendered).to include(@simulation.computation_time.to_s)
    expect(rendered).to include(@simulation.computed_at.to_s)
  end
end
