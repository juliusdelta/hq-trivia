# frozen_string_literal: true

module SessionJoinable
  extend ActiveSupport::Concern

  included do
    has_many :played_sessions,
             lambda {
               where(active: false)
             },
             class_name: 'PlayerSession',
             dependent: :destroy,
             inverse_of: :user
    has_one :current_session,
            lambda {
              where(active: true)
            },
            class_name: 'PlayerSession',
            dependent: :destroy,
            inverse_of: :user
  end

  def join_with_session_for(game_instance)
    return false unless can_join_with_session?(game_instance)

    PlayerSession.create(user: self, game_instance:, active: true)
  end

  def disconnect_from_current_session(player_session)
    player_session.disconnect if player_session.active
  end

  def can_join_with_session?(game_instance)
    rejoinable?(game_instance) || (current_session.nil? && game_instance.joinable?)
  end

  def rejoinable?(game_instance)
    current_session.game_instance.id == game_instance.id
  end
end
