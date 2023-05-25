# frozen_string_literal: true

class User < ApplicationRecord
  include SessionJoinable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :game_instances
  has_many :won_games, class_name: 'GameInstance', foreign_key: 'winner_id', dependent: :destroy, inverse_of: :winner
end
