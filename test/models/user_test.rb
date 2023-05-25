# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'can join a session for game instance' do
    user = users(:beth)
    instance = game_instances(:math_instance)

    user.join_with_session_for(instance)
    user.reload

    assert_not_nil user.current_session
  end

  test 'cannot join multiple game instances' do
    user = users(:sam)
    instance = game_instances(:math_instance)

    user.join_with_session_for(instance)
    user.reload

    assert_raises StandardError do
      user.join_with_session_for(instance)
    end
  end
end
