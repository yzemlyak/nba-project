class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.integer :team_id
      t.string :name
      t.float :points_per_game
      t.float :rebounds_per_game
      t.float :assists_per_game

      t.timestamps
    end
  end
end
