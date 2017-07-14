class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :player_id
      t.integer :card_id
      t.integer :round_id
      t.boolean :user_answer

      t.timestamps null: false
    end
  end
end
