require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test 'validate answer is in options' do
    game = games(:math)

    invalid_question = Question.new(question: 'What is 1+1?', options: %w[1 3 4], answer: '2', game:)
    valid_question = Question.new(question: 'What is 2+2', options: %w[1 2 3 4], answer: '4', game:)

    assert_raises ActiveRecord::RecordInvalid do
      invalid_question.save!
    end
    assert valid_question.save
  end
end
