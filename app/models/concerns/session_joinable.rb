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

  def join_session_for(game_instance)
    PlayerSession.create!(user: self, game_instance:) if can_join_session?
  end

  def disconnect_from_session(player_session)
    player_session.disconnect if player_session.active
  end

  def can_join_session?
    current_session.nil?
  end
end
