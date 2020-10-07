class AddRushesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :rushes do |t|
      t.string :name # Player
      t.string :team # Team
      t.string :position #Pos
      t.integer :attempts # Att
      t.float :attempts_per_game # Att/G
      t.integer :yards # Yds
      t.float :avg_yards # Avg
      t.float :yards_per_game # Yds/G
      t.integer :touchdowns # TD
      t.integer :longest_rush # Lng
      t.integer :first_downs # 1st
      t.float :first_down_percent # 1st%
      t.integer :over_20_yards # 20+
      t.integer :over_40_yards # 40+
      t.integer :fumbles # fum
    end
  end
end
