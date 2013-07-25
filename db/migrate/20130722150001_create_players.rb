class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :given_name
      t.string :surname
      t.integer :average
      t.integer :home_runs
      t.integer :rbi
      t.integer :runs
      t.integer :steals
      t.integer :ops

      t.timestamps
    end
  end
end
