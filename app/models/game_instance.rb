# frozen_string_literal: true

# 'pending'
# 'questioning'
# 'answered'
# 'completed'

class GameInstance < ApplicationRecord
  MAX_PLAYER_COUNT = 200

  belongs_to :game
  belongs_to :winner, class_name: 'User', optional: true
  has_many :player_sessions, dependent: :destroy

  scope :pending, -> { where(state: 'pending') }

  def joinable?
    state == 'pending' && player_sessions.count <= MAX_PLAYER_COUNT
  end
end
