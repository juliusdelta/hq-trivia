# frozen_string_literal: true

# 'pending'
# 'questioning'
# 'answered'
# 'completed'

class GameInstance < ApplicationRecord
  MAX_PLAYER_COUNT = 200

  attr_reader :current_state

  belongs_to :game
  belongs_to :winner, class_name: 'User', optional: true
  has_many :player_sessions, dependent: :destroy

  scope :pending, -> { where(state: 'pending') }

  after_initialize :set_state

  def joinable?
    state == 'pending' && player_sessions.count <= MAX_PLAYER_COUNT
  end

  def set_state
    @current_state = GameInstanceState.set_state(self, state)
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
