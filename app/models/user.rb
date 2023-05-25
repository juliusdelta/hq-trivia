# frozen_string_literal: true

class User < ApplicationRecord
  include SessionJoinable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  belongs_to :game_instance, optional: true
  has_many :won_games, class_name: 'GameInstance', foreign_key: 'winner_id', dependent: :destroy, inverse_of: :winner
end
