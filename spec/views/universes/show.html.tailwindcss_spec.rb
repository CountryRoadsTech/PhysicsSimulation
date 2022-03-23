require 'rails_helper'

RSpec.describe "universes/show", type: :view do
  before(:each) do
    @universe = assign(:universe, Universe.create!(
      simulation: nil,
      start_time: "9.99",
      end_time: "9.99",
      timestep: "9.99",
      number_of_timesteps: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2/)
  end
end
