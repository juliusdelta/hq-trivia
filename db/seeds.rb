# frozen_string_literal: true

Game.destroy_all
User.destroy_all
Question.destroy_all

# QUESTIONS = [
#   Question.new({ question: 'What is 1 + 1', options: %w[1 2 3 4], answer: '2' }),
#   Question.new({ question: 'What is 2 + 2', options: %w[1 2 3 4], answer: '4' })
# ].freeze

GAMES = [
  {
    topic: 'Game of Thrones',
    description: 'Most popular show of all time.',
    questions_attributes: [{ question: 'Who is Jon Snow?', options: ['Sansa', 'Joffery', 'King', 'King of the North'],
                             answer: 'King of the North' }]
  },
  {
    topic: 'The Office',
    description: 'Popular NBC show -- Toby would not approve.',
    questions_attributes: [{ question: 'Who did Michael Scott marry?', options: %w[pam stanley toby holly],
                             answer: 'holly' }]
  },
  {
    topic: 'Star Wars',
    description: 'Epic fantasy sci-fi fantasy with the loudest fans.',
    questions_attributes: [{ question: 'What is 2 + 2', options: %w[1 2 3 4], answer: '4' }]
  }
].freeze

USERS = [
  { email: 'beth@test.com', password: 'beth123' },
  { email: 'james@test.com', password: 'james123' },
  { email: 'sam@test.com', password: 'sam123' }
].freeze

GAMES.each do |game|
  Game.create!(**game)
end

USERS.each { |user| User.create!(email: user[:email], password: user[:password]) }
