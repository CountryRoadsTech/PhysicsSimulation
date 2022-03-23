require 'rails_helper'

RSpec.describe "universes/new", type: :view do
  before(:each) do
    assign(:universe, Universe.new(
      simulation: nil,
      start_time: "9.99",
      end_time: "9.99",
      timestep: "9.99",
      number_of_timesteps: 1
    ))
  end

  it "renders new universe form" do
    render

    assert_select "form[action=?][method=?]", universes_path, "post" do

      assert_select "input[name=?]", "universe[simulation_id]"

      assert_select "input[name=?]", "universe[start_time]"

      assert_select "input[name=?]", "universe[end_time]"

      assert_select "input[name=?]", "universe[timestep]"

      assert_select "input[name=?]", "universe[number_of_timesteps]"
    end
  end
end
