require 'rails_helper'

RSpec.describe "physics_bodies/show", type: :view do
  before(:each) do
    @physics_body = assign(:physics_body, PhysicsBody.create!(
      universe: nil,
      name: "MyText",
      slug: "MyText",
      description: nil,
      initial_position_x: "9.99",
      initial_position_y: "9.99",
      initial_position_z: "9.99",
      initial_velocity_x: "9.99",
      initial_velocity_y: "9.99",
      initial_velocity_z: "9.99",
      initial_mass: "9.99",
      positions_x: "9.99",
      positions_y: "9.99",
      positions_z: "9.99",
      velocities_x: "9.99",
      velocities_y: "9.99",
      velocities_z: "9.99",
      accelerations_x: "9.99",
      accelerations_y: "9.99",
      accelerations_z: "9.99",
      forces_x: "9.99",
      forces_y: "9.99",
      forces_z: "9.99",
      thrusts_x: "9.99",
      thrusts_y: "9.99",
      thrusts_z: "9.99",
      masses: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
