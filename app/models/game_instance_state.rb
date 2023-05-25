# frozen_string_literal: true

class GameInstanceState
  STATES = {
    pending: 'PendingState',
    in_progress: 'InProgressState',
    completed: 'CompletedState'
  }.freeze

  attr_accessor :state, :game_instance

  class << self
    def set_state(game_instance, state)
      STATES[state.to_sym].constantize.new(game_instance, state)
    end
  end

  def initialize(game_instance, state)
    @game_instance = game_instance
    @state = state
  end

  def begin; end

  def complete; end
end

class PendingState < GameInstanceState
  def begin
    game_instance.transition_to(InProgressState.new(game_instance, 'in_progress'))
  end

  def complete
    raise StandardError 'Game must be played to be completed.'
  end
end

class InProgressState < GameInstanceState
  def begin
    raise StandardError 'The game has already started.'
  end

  def complete
    game_instance.transition_to(CompletedState.new(game_instance, 'completed'))
  end
end

class CompletedState < GameInstanceState
  def begin
    raise StandardError 'The game has already started.'
  end

  def complete
    raise StandardError 'Game has already completed'
  end
end
