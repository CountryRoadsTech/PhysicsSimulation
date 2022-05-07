# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'physics_bodies/edit', type: :view do
  before do
    @physics_body = assign(:physics_body, PhysicsBody.create!(
                                            universe: nil,
                                            name: 'MyText',
                                            slug: 'MyText',
                                            description: nil,
                                            initial_position_x: '9.99',
                                            initial_position_y: '9.99',
                                            initial_position_z: '9.99',
                                            initial_velocity_x: '9.99',
                                            initial_velocity_y: '9.99',
                                            initial_velocity_z: '9.99',
                                            initial_mass: '9.99',
                                            positions_x: '9.99',
                                            positions_y: '9.99',
                                            positions_z: '9.99',
                                            velocities_x: '9.99',
                                            velocities_y: '9.99',
                                            velocities_z: '9.99',
                                            accelerations_x: '9.99',
                                            accelerations_y: '9.99',
                                            accelerations_z: '9.99',
                                            forces_x: '9.99',
                                            forces_y: '9.99',
                                            forces_z: '9.99',
                                            thrusts_x: '9.99',
                                            thrusts_y: '9.99',
                                            thrusts_z: '9.99',
                                            masses: '9.99'
                                          ))
  end

  it 'renders the edit physics_body form' do
    render

    assert_select 'form[action=?][method=?]', physics_body_path(@physics_body), 'post' do
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
