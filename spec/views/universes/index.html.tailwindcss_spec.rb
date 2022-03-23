require 'rails_helper'

RSpec.describe "universes/index", type: :view do
  before(:each) do
    assign(:universes, [
      Universe.create!(
        simulation: nil,
        start_time: "9.99",
        end_time: "9.99",
        timestep: "9.99",
        number_of_timesteps: 2
      ),
      Universe.create!(
        simulation: nil,
        start_time: "9.99",
        end_time: "9.99",
        timestep: "9.99",
        number_of_timesteps: 2
      )
    ])
  end

  it "renders a list of universes" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
