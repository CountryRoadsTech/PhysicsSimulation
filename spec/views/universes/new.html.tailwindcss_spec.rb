# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'universes/new', type: :view do
  before do
    assign(:universe, build(:universe))
  end

  it 'renders new universe form' do
    render

    assert_select 'form[action=?][method=?]', universes_path, 'post' do
      assert_select 'input[name=?]', 'universe[simulation_id]'

      assert_select 'input[name=?]', 'universe[start_time]'

      assert_select 'input[name=?]', 'universe[end_time]'

      assert_select 'input[name=?]', 'universe[timestep]'

      assert_select 'input[name=?]', 'universe[number_of_timesteps]'
    end
  end
end
