require 'rails_helper'

RSpec.describe "simulations/show", type: :view do
  before(:each) do
    @simulation = assign(:simulation, Simulation.create!(
      name: "MyText",
      slug: "MyText",
      description: nil,
      computation_time: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
  end
end
