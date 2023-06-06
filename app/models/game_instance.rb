# frozen_string_literal: true

# 'pending'
# 'questioning'
# 'answered'
# 'completed'
# require_relative './game_instance_state'

class GameInstance < ApplicationRecord
  MAX_PLAYER_COUNT = 200

  belongs_to :game
  belongs_to :winner, class_name: 'User', optional: true
  has_many :player_sessions, dependent: :destroy

  scope :pending, -> { where(state: 'pending') }

  after_initialize :current_state

  STATES = {
    pending: GameInstanceState::PendingState,
    in_progress: GameInstanceState::InProgressState,
    completed: GameInstanceState::CompletedState
  }.freeze

  def joinable?
    state == 'pending' && player_sessions.count <= MAX_PLAYER_COUNT
  end

  def current_state
    @current_state = STATES[state.to_sym].new(self, state)
  end

  def transition_to(state_obj)
    self.state = state_obj.state
    save!
    reload

    @current_state = state_obj
  end

  def begin!
    @current_state.begin
  end

  def complete!
    @current_state.complete
  end
end
