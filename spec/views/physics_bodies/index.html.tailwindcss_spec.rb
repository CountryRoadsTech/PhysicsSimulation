# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'physics_bodies/index', type: :view do
  before do
    assign(:physics_bodies, [
             PhysicsBody.create!(
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
             ),
             PhysicsBody.create!(
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
             )
           ])
  end

  it 'renders a list of physics_bodies' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
  end
end
