class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :post_body

      t.timestamps(null: false)
    end
  end
end
