# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'physics_bodies/new', type: :view do
  before do
    assign(:physics_body, build(:physics_body))
  end

  it 'renders new physics_body form' do
    render

    assert_select 'form[action=?][method=?]', physics_bodies_path, 'post' do
      assert_select 'input[name=?]', 'physics_body[universe_id]'

      assert_select 'textarea[name=?]', 'physics_body[name]'

      assert_select 'textarea[name=?]', 'physics_body[slug]'

      assert_select 'input[name=?]', 'physics_body[description]'

      assert_select 'input[name=?]', 'physics_body[initial_position_x]'

      assert_select 'input[name=?]', 'physics_body[initial_position_y]'

      assert_select 'input[name=?]', 'physics_body[initial_position_z]'

      assert_select 'input[name=?]', 'physics_body[initial_velocity_x]'

      assert_select 'input[name=?]', 'physics_body[initial_velocity_y]'

      assert_select 'input[name=?]', 'physics_body[initial_velocity_z]'

      assert_select 'input[name=?]', 'physics_body[initial_mass]'

      assert_select 'input[name=?]', 'physics_body[positions_x]'

      assert_select 'input[name=?]', 'physics_body[positions_y]'

      assert_select 'input[name=?]', 'physics_body[positions_z]'

      assert_select 'input[name=?]', 'physics_body[velocities_x]'

      assert_select 'input[name=?]', 'physics_body[velocities_y]'

      assert_select 'input[name=?]', 'physics_body[velocities_z]'

      assert_select 'input[name=?]', 'physics_body[accelerations_x]'

      assert_select 'input[name=?]', 'physics_body[accelerations_y]'

      assert_select 'input[name=?]', 'physics_body[accelerations_z]'

      assert_select 'input[name=?]', 'physics_body[forces_x]'

      assert_select 'input[name=?]', 'physics_body[forces_y]'

      assert_select 'input[name=?]', 'physics_body[forces_z]'

      assert_select 'input[name=?]', 'physics_body[thrusts_x]'

      assert_select 'input[name=?]', 'physics_body[thrusts_y]'

      assert_select 'input[name=?]', 'physics_body[thrusts_z]'

      assert_select 'input[name=?]', 'physics_body[masses]'
    end
  end
end
