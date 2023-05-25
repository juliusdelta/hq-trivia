# frozen_string_literal: true

class Game < ApplicationRecord
  validates :topic, presence: true

  has_many :questions, dependent: :destroy
  has_many :game_instances, dependent: :destroy

  accepts_nested_attributes_for :questions

  def upcoming_instance
    game_instances.pending.first
  end
end
