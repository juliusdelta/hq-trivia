# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :question, null: false
      t.string :options, array: true, default: [], null: false
      t.string :answer, null: false
      t.references :game, null: false

      t.timestamps
    end
  end
end
