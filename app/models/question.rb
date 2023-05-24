# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :game
  validate :answer_in_options

  private

  def answer_in_options
    return if options.include?(answer)

    errors.add(:options, 'Options must include the correct answer!')
  end
end
