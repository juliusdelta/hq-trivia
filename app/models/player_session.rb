# frozen_string_literal: true

class PlayerSession < ApplicationRecord
  belongs_to :user
  belongs_to :game_instance

  def disconnect
    self.active = false
    save!
  end
end
