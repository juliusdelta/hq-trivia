# frozen_string_literal: true

require 'test_helper'

class GameInstanceTest < ActiveSupport::TestCase
  test 'transitions to in_progress from pending state' do
    game = games(:math)
    game_instance = GameInstance.new(game:, state: 'pending')

    assert_equal 'pending', game_instance.state

    assert_raises StandardError do
      game_instance.complete!
    end
    game_instance.begin!

    assert_equal 'in_progress', game_instance.state
  end

  test 'transitions to completed from in_progress state' do
    game = games(:math)
    game_instance = GameInstance.new(game:, state: 'in_progress')

    assert_raises StandardError do
      game_instance.begin!
    end

    game_instance.complete!

    assert_equal 'completed', game_instance.state
  end
end
