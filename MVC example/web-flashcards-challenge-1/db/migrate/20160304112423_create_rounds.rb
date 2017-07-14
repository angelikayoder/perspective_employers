class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :player_id
      t.integer :deck_id

      t.timestamps null: false
    end
  end
end
