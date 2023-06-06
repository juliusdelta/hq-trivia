# frozen_string_literal: true

class PlayerSession < ApplicationRecord
  belongs_to :user
  belongs_to :game_instance

  after_create_commit do
    broadcast_update_to game_instance, partial: 'game_instances/player_session_count', target: 'player-count',
                                       locals: { game_instance: }
  end

  def disconnect
    self.active = false
    save!
  end
end
