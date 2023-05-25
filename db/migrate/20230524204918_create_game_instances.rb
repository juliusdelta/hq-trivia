# frozen_string_literal: true

class CreateGameInstances < ActiveRecord::Migration[7.1]
  def change
    create_table :game_instances do |t|
      t.references :game, null: false, foreign_key: true
      t.references :winner
      t.string :state

      t.timestamps
    end
  end
end
