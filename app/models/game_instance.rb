# frozen_string_literal: true

class GameInstance < ApplicationRecord
  belongs_to :game
  belongs_to :winner, class_name: 'User'
end
