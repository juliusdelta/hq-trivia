# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'can join a session for game instance' do
    user = users(:beth)
    game = games(:math)

    instance = GameInstance.create!(game:, state: 'playing')

    user.join_session_for(instance)

    assert_equal 1, instance.player_sessions.count
  end
end
