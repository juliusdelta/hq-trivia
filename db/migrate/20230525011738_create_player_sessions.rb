class CreatePlayerSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :player_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game_instance, null: false, foreign_key: true
      t.boolean :active, null: false, default: false

      t.timestamps
    end
  end
end
