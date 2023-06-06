# frozen_string_literal: true

module GameInstanceState
  class State
    attr_accessor :state, :game_instance

    def initialize(game_instance, state)
      @game_instance = game_instance
      @state = state
    end

    def begin; end

    def complete; end
  end

  class PendingState < State
    def begin
      game_instance.transition_to(InProgressState.new(game_instance, 'in_progress'))
    end

    def complete
      raise StandardError 'Game must be played to be completed.'
    end
  end

  class InProgressState < State
    def begin
      raise StandardError 'The game has already started.'
    end

    def complete
      game_instance.transition_to(CompletedState.new(game_instance, 'completed'))
    end
  end

  class CompletedState < State
    def begin
      raise StandardError 'The game has already started.'
    end

    def complete
      raise StandardError 'Game has already completed'
    end
  end
end
