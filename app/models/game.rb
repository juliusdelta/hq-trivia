# frozen_string_literal: true

class Game < ApplicationRecord
  validates :topic, presence: true

  has_many :questions, dependent: :destroy

  accepts_nested_attributes_for :questions
end